# For Permute algorithm.
# Code was developed in permute.pl, then minified into p.pl
# Total chars = 249
# (depends if you count \n - if so, just remove them)
# (The qw(...) thing saves a few chars if the list has more than 2 strings in it)
# Yogi Berra quote via https://en.wikiquote.org/wiki/Yogi_Berra
# "You can observe a lot by watching"

perl -e'$r=[
[qw(You I We All)],
[qw(can do did may)],
[qw(observe see spot get gain spy)],
["a lot","much","some","lots","nowt","all"],
[qw(by with without in)],
[qw(watching seeing listening doing)]
];sub p{my($s,$i)=@_;my$w=$r->[$i];if(!@$w){print"$s.\n";return}map{p("$s $_",$i+1)}@$w}p;'

# The basic algorithm is:
# - iterate through all permutations of this sentence.
