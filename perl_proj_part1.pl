#!/usr/bin/perl
# Kristy Li
# Perl Program Project #1: Part 1

use strict;
use warnings;

open(FILE, "<solar.txt") or die "Can't open file, $!";
my $array = <FILE>;

print "Records that do not list a discoverer in the eighth field:\n\n";
while (<FILE>) {
  my @temparray = split/ /;
  if($temparray[7] eq "-") {
    print "@temparray";
  }
}

seek FILE, 0, 0;
print "\n\n\nEvery record after erasing the second field:\n\n";
while(<FILE>) {
  my @temparray = split(/ /, $_);
  splice(@temparray, 1, 1);
  print "@temparray";
}

seek FILE, 0, 0;
print "\n\n\nRecords for satellites that have negative orbital periods:\n\n";
while(<FILE>) {
  my @temparray = split(/ /, $_);
  print "@temparray" if ($temparray[4] =~ m/-\d+/);
}

seek FILE, 0, 0;
print "\n\n\nData for the objects discovered by the Voyager2 space probe:\n\n";
while(<FILE>) {
  my @temparray = split(/ /, $_);
  if($temparray[7] =~ m/Voyager2/) {
    print "@temparray";
  }
}

seek FILE, 0, 0;
print "\n\n\nEach record with the orbital period given in seconds rather than days:\n\n";
while(<FILE>) {
  my @temparray = split(/ /, $_);
  if($temparray[4] =~ m/\d.\d+/) {
    $temparray[4] *= 24 * 60 * 60; }
  print "@temparray";
}
close FILE;
