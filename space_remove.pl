#!/usr/bin/perl
use warnings;
use strict;

my @filelist=`find $ARGV[0]`;
my $filename;



foreach $filename(@filelist) {

    if ($filename =~ m/.\s./) {
    my $cfilename = $filename ;


    $filename =~ s/\s/\\ /g;
    $filename =~ s/\(/\\\(/g;
    $filename =~ s/\)/\\\)/g;
    $filename =~ s/'/\\'/g;


    $cfilename =~ s/\s/_/g;
    $cfilename =~ s/\(//g;
    $cfilename =~ s/\)//g;
    $cfilename =~ s/'//g; # '


    chomp $filename;

    chomp $cfilename;

    $cfilename =~ s/\s//g;
    $cfilename =~ s/\s//g;

    $filename=~s/\s+$//;
    $cfilename=~s/\s+$//;

    $filename=~s/\_$//;
    $cfilename=~s/\_$//;


    chop $filename;
system "mv $filename $cfilename";
#print "mv $filename $cfilename\n";


  }
}
print "\n";
