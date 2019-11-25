#!/usr/bin/bash

# For riffleShuffle algorithm.
# Code was developed in riffleShuffle.pl, then minified into r.pl
# In the while loop, increase the completion threshold to approx 500, while($c++<500), to be sure to generate > 50K words.
# The argument is a text file named t.
# Total chars = 368

perl -e'sub r{$N=2+int(rand(5));($t,$u)=@_;if($t=~/^(\W*(?:\w+\W*){$N})(\w+)(\W+)(.*)/){$b=$1;$c=$1.$2.$3;$w=$2;$t=$4;if($u=~/.*?(\W+${w})(\W.*)/i){$u=$2;return$b.$1.r($u,$t)}return$c}}@T=map{join("",qx{cat $_})=~s/\R/ /gr=~s/.*?Chapter [1I]\s(.*)End of the Project G.*/\1/ir=~s/Chapter \w+//rg}@ARGV;while($i++<10){print r(@T)=~s/^\W+//r."\n\n"}' 1342-0.txt 158-0.txt

# The basic algorithm is:
# - skip over the intro blurb til the last mention of "Chapter 1"
# - pick a random int, N, 2-6
# - copy the next N-1 words, and look for the next occurrence of the Nth word in the second text, switch the 2 texts and start again from there.
# - until you reach the end of the main texts
# - repeat the whole thing again until you have (probably) accumulated 50k words.
