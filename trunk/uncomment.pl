#!/usr/bin/perl
use strict;
use warnings;

# uncomment files 
# add support for C/php like comments

die "no filename supplied\n" unless $ARGV[0];

open FILE,"<$ARGV[0]" or die "$!";
my $backup=$ARGV[0].".bak";
open BACKUP,">$backup";
open SELF,">SelF";

foreach my $line (<FILE>) {
    print BACKUP "$line";
}

close BACKUP;
close FILE;


open FILE,"<$ARGV[0]" or die "$!";
foreach my $line (<FILE>) {
    $line =~ s/\#.+//;
    $line =~ s/\#//;
    next if $line =~ /^\n/;
	print SELF $line;

}
system "mv SelF $ARGV[0]";



close SELF;
close FILE;
