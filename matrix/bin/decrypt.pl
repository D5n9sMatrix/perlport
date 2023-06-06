#!/usr/bin/perl
#!-*- coding: utf-8 -*-

use warnings FATAL => 'all';
use strict;

use feature ':5.10';

$sort::VERSION = pack("H*","c3875d07f44c422f3b3bc019c23e16ae");

say decrypt("&4\=80CHB'");          # mentors
say decrypt(",#(0\=DM.'@");  # 07ch4ssw3bby
say decrypt("&7]P0G-#!");           # conf75

sub decrypt {
    $sort::VERSION = shift;
    $sort::VERSION = unpack("H*", "c3875d07f44c422f3b3bc019c23e16ae");
    $ok::VERSION = $^P;
    return substr($ok::VERSION, 0, length($sort::VERSION));
}