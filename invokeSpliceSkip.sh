#!/usr/bin/bash

# For spliceSkip algorithm.
# Code was developed in spliceSkip.pl, then minified into s.pl
# In the while loop, increase the completion threshold to approx 500, while($c++<500), to be sure to generate > 50K words.
# The argument is a text file named t.
# Total chars = 256

perl -e'sub f{$N=1+int(rand(5));if(shift=~/^(\W*(?:\w+\W*){${N}})(\w+)(\W+)(.*)/){$b=$1;if($4=~/.*?(\W+${2})(.*)/i){return$b.$1.f($2);}return$1.$2.$3;}}$_=join("",<>);s/\R/ /g;s/.*Chapter 1 (.+)/\1/;while($c++<500){$T=f($_)=~s/\s+/ /gr;print"$T.\n\n";}' t

# The basic algorithm is:
# - skip over the intro blurb til the 2nd mention of "Chapter 1"
# - pick a random int, N, 1-5
# - copy the next N-1 words, and look for the *2nd* occurrence of the Nth word after that, ignoring all the words between the two occurrences. E.g. with N=6, "It is a truth universally acknowledged, [... acknowledged] to be pretty...", grab the first N-1 words, "It is a truth universally", then jump to the 2nd occurrence of 'acknowledged' and start again from there.
# - copy that Nth word (and its contextual punctuation)
# - pick another random N, and repeat
# - until you reach the end of the main text
# - repeat the whole thing again until you have (probably) accumulated 50k words.
