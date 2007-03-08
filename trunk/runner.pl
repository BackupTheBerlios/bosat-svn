#!/usr/bin/perl

use warnings;
use strict;


die "no command\n" unless $ARGV[0];
die "no interval\n" unless $ARGV[1];

my $command=$ARGV[0];
my $interval=$ARGV[1];
my $count;



    for ($count=0;$count<=$interval;$count++) {
	system $command;
}
