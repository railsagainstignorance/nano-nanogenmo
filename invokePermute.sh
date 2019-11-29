#!/usr/bin/bash

# For Permute algorithm.
# Code was developed in permute.pl, then minified into p.pl
# Total chars = 249
# (depends if you count \n - if so, just remove them)
# (The qw(...) thing saves a few chars if the list has more than 2 strings in it)

perl -e'$r=[
[qw(I We You)],
[qw(ran hop go)],
["to","by"],
[qw(the a our)],
[qw(red blue grey)],
["egg","cup"],
["of","for"],
["my","your"],
[qw(pal owl bud dog set)]
];sub p{my($s,$i)=@_;my$w=$r->[$i];if(!@$w){print"$s.\n";return}map{p("$s $_",$i+1)}@$w}p;'

# The basic algorithm is:
# - iterate through all permutations of this sentence.
