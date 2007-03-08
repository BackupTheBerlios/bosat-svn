#!/usr/bin/perl
use strict;
use warnings;

# uncomment files 
# bug : unable to detect middle comment files 

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
    unless ($line =~ /^\#/) {
	unless ($line =~ /^\n/) {
	    unless ($line =~ /\s+\#/)  {
	print SELF $line;

    }}}
}
system "mv SelF $ARGV[0]";



close SELF;
close FILE;
