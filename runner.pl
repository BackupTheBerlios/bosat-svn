#!/usr/bin/perl
print "command  : ";chomp ($com=<stdin>);
print "interval : ";chomp ($int=<stdin>);
for ($a=0 ; $a < $int ; $a++) {system ($com);}
