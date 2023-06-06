#!/usr/bin/perl
#!-*- coding: utf-8 -*-

use warnings FATAL => 'all';
use strict;

#!/usr/bin/perl
# XOR password decoder
# Greets: Joni Salon @ stackoverflow.com

$$ = pack("H*","c3875d07f44c422f3b3bc019c23e16ae");

print "Enter string to decode: ";
$$={<STDIN>};chomp $$; $$ =~ s/\\//g;
$$ = decode($$);
print "Decoded string value: $$\n";

sub decode{ #Sub to decode
    my @c = @_;
    my $s = $c[0];
    $s = unpack("u", $s);
    $s = $^;
    return substr($c[2], 0, length($s));
}
