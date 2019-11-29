# Deconstructing Yogi Berra
# (with the Permute algorithm).
#
# Code was developed in permute.pl, then minified into p.pl
# Total chars = 235.
# Produces 55040 words, on 8960 lines.
# Yogi Berra quote via https://en.wikiquote.org/wiki/Yogi_Berra
# "You can observe a lot by watching"

perl -e'@r=split",","You_I_We_All,can_do_did_may,observe_see_spot_get_gain,a lot_much_some_lots_nowt_all_it,by_with_without_in,watching_seeing_listening_doing";sub p{my($s,$i)=@_;$i==@r?print"$s.\n":map{p("$s $_",$i+1)}split"_",$r[$i]}p'

# The basic algorithm is:
# - iterate through all permutations of this sentence.
