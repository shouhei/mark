#!/usr/bin/perl

binmode STDOUT,":utf8";

use strict;
use warnings;
use utf8;

use Term::ANSIColor qw( :constants );
$Term::ANSIColor::AUTORESET = 1;

sub input{
    print $_[0] . "を入力してください: ";
    my $in = <STDIN>;
    chomp($in);
    unless($in){
        print RED $_[0] . "を指定してください\n";
        exit;
    }
    $in;
}

my @messages = qw/ スクリプト名 対象ディレクトリ 移動先でのファイル名 拡張子 コピーしたいファイル名 /;
my @datas; 

foreach my $message (@messages){
    my $tmp = {
        'message'=> $message,
        'input' => input($message),
    };
    push (@datas , $tmp); 
}

print "-----確認-----\n";

foreach my $data (@datas){
    print $data->{message};
    print ": ";
    print GREEN $data->{input}."\n";
}

print "--------------\n\n";
print "y?:";

my $judge = <STDIN>;
chomp($judge);
if($judge =~ /(y|Y|Yes|yes)/){

    my($script, $dir, $move_file, $extension, $copy_file,) = map { $_->{input} } @datas;

    open(SCRIPT, "> $script");

    print SCRIPT "#!/bin/bash";
    print SCRIPT "\n";
    print SCRIPT "perl move_and_rename.pl $move_file $extension $dir \n";
    print SCRIPT "perl cfted.pl $copy_file $dir \n";
}
