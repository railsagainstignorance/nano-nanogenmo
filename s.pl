sub f{$N=1+int(rand(5));if(shift=~/^(\W*(?:\w+\W*){${N}})(\w+)(\W+)(.*)/){$b=$1;if($4=~/.*?(\W+)(${2})(.*)/i){return$b.$1.$2.f($3);}return$1.$2.$3;}}$_=join("",<>);s/\R//g;while($c<1000){$T=f( $_ )=~s/\s+/ /gr;print"$T.\n";$c+=scalar(split(/\W+/,$T));}