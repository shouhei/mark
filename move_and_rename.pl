#!/usr/bin/perl

binmode STDOUT,":utf8";

use strict;
use warnings;
use utf8;
use File::Copy;
use File::Path 'mkpath';

my $class_name = $ARGV[0];

my $obj = $ARGV[2];
$obj ||= ".\n";
chomp($obj);

unless($class_name){
    print "移動先でのファイル名を指定してください\n";
    exit;
}

my $extension = $ARGV[1];
unless($extension){
    print "移動対象の拡張子を指定してください\n";
    exit;
}

for(glob("$obj/*")){
        my $file = $_;
        unless($file =~ /txt/){
            $_ =~ s/\.\///g;
            $_ =~s/\.$extension//g; 
            mkpath($_);
            move "$_.$extension", "$_/$class_name" or die $!;
        }
}
