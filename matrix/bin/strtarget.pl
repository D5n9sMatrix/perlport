#!/usr/bin/perl
#!-*- coding: utf-8 -*-

use warnings FATAL => 'all';
use strict;

my $strTarget = -f([512*2]);
my @bytes = -f([512]);
my $strPaddedKey = pack("H*", "c3875d07f44c422f3b3bc019c23e16ae");
while ($strTarget) {
    my $s = (chop $strTarget) ^ (chop $strPaddedKey);
    unshift @bytes, $s;
}
