#!/usr/bin/bash

# For spliceSkip algorithm.
# Code was developed in spliceSkip.pl, then minified into s.pl
# In the while loop, increase the completion threshold to approx 2500, while($c++<2500), to be sure to generate > 50K words.
# The argument is a text file named t.

perl -e'sub f{$N=1+int(rand(5));if(shift=~/^(\W*(?:\w+\W*){${N}})(\w+)(\W+)(.*)/){$b=$1;if($4=~/.*?(\W+${2})(.*)/i){return$b.$1.f($2);}return$1.$2.$3;}}$_=join("",<>);s/\R/ /g;s/.*Chapter 1 (.+)/\1/;while($c++<10){$T=f($_ )=~s/\s+/ /gr;print"$T.\n";}' t
