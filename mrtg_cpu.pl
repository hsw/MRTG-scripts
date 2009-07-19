#!/usr/bin/perl -w

use strict;

use BSD::Sysctl 'sysctl';
use List::Util qw/sum/;

my $cache_fn = "/tmp/kern_cp_time.$>.txt";

my @prev_data = cache_get();

my $var = sysctl('kern.cp_time');

cache_set(@$var);

# user nice sys interrupt idle
my @delta = (0, 0, 0, 0, 0);
if (@prev_data) {
    @delta = map {
        my $prev = shift @prev_data;
        $_ > $prev ? $_ - $prev : 0;
        } @$var;
    my $sum = sum(@delta);
    if ($sum > 0) {
        @delta = map { $_ / $sum } @delta;
    }
}

printf("%d\n%d\n%s\nCPU Utilize\n",
    ($delta[2] + $delta[3]) * 100, # sys+interrupt
    ($delta[0] + $delta[1]) * 100, # user+nice
    get_uptime(),
    ); # uptime

1;

sub cache_get {
    my @res;
    if (-r $cache_fn) {
        open F, '<', $cache_fn
            or die "Can't open $cache_fn";
        if (defined(my $s = <F>)) {
            chomp $s;
            @res = split(' ', $s);
        }
        close F;
    }
    return @res;
}

sub cache_set {
    open F, '>', $cache_fn
        or die "Can't open $cache_fn";
    print F join(' ', @_)."\n";
    close F;
}

sub get_uptime {
    return int(time()-sysctl('kern.boottime'));
}
