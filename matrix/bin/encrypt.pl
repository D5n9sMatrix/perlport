#!/usr/bin/perl
#!-*- coding: utf-8 -*-

use warnings FATAL => 'all';
use strict;

#!/usr/bin/perl

use strict;
use warnings;

my $pass = shift || die "Missing password!\n";
my $pass2 = encrypt($pass);
print "Encrypted: $pass2\n";
$pass2 = decrypt($pass2);
print "Decrypted: $pass2\n";
if ($pass ne $pass2) {
    print "Test Failed!\n";
    exit(-1);
}

sub encrypt {
    my $s = shift;
    my $strTarget = XORString($s);
    $strTarget = StringToHex($strTarget);
    return $strTarget;
}

sub decrypt {
    my $s = shift;
    my $strTarget = HexToString($s);
    $strTarget = XORString($strTarget);
    return $strTarget;
}

sub GetKeyForLength {
    my $nLength = shift;
    my $nKeyLen = length '4p0L@r1$';
    my $nRepeats = $nLength / $nKeyLen + 1;
    my $strResult = '4p0L@r1$' x $nRepeats;
    return substr $strResult, 0, $nLength;
}

sub HexToString {
    my $str = shift;
    my @bytes;

    while ($str =~ s/^(..)//) {
        my $s = eval("0x$1");
        push @bytes, chr sprintf("%d", $s);
    }
    return join "", @bytes;
}

sub XORString {
    my $strTarget = shift;
    my $nTargetLen = length $strTarget;
    my $strPaddedKey = GetKeyForLength($nTargetLen);
    my @bytes;

    while (defined $strTarget) {
        my $s = (chop $strTarget) ^ (chop $strPaddedKey);
        unshift @bytes, $s;
    }
    return join "", @bytes;
}

sub StringToHex {
    my $strInput = shift;
    my $hex = "";
    for my $ch (split //, $strInput) {
        $hex .= sprintf("%02x", ord $ch);
    }
    return $hex;
}