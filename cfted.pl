#!/usr/bin/perl

binmode STDOUT,":utf8";

use strict;
use warnings;
use utf8;
use File::Copy;

my $file = $ARGV[0];

unless($file){
    print "コピーしたいファイル名を指定してください\n";
    exit;
}

my $dir = $ARGV[1];
$dir ||= ".\n";
chomp($dir);
for(glob($dir."/*")){
       $_ =~ s/\.\///g;
       if($_ !~ /\./){
           copy "$file", "$_/$file" or die $!;
       }
}

