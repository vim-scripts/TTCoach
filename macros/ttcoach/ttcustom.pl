#!/usr/bin/perl
# Creating custom exercises from engspchk dictionaries
# Script for TTCoach plugin. 
# Author: Mikolaj Machowski <mikmach@wp.pl>
# (c) Mikolaj Machowski 2002

open (DICT, $ARGV[0]) or die "I can't open file:$!";
undef $/;
@total_table = split /\s/, <DICT>;
close DICT;
my $args = (@ARGV)[ 1 .. $#ARGV ];
foreach (@total_table) {
	push @little_table, $_ if /$ARGV[1]/i && /$ARGV[2]/i && /$ARGV[3]/i;
}
$length_little_table = @little_table;
$mod = ($length_little_table - ($length_little_table % 100))/100;
for ($i = int(rand 500); $i <= $length_little_table; $i = $i + $mod) {
	push @last_table, $little_table[$i];
}
for $i(1..$#last_table) {
	unshift @last_table,splice(@last_table,$i+rand($i),1);
}
print "\" Custom file \"\n";
foreach (@last_table) {
	if ($number_chars == 0) {
		print $_;
		$number_chars = $number_chars + 1 + length;
	} elsif ($number_chars < 60) {
		print " " . $_;
		$number_chars = $number_chars + 1 + length;
	} else {
		print "÷\n\n";
		$number_chars = 0;
	}
}
print "÷";
