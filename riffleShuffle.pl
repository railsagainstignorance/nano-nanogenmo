#!/usr/bin/perl


sub r
{
  $N = 2 + int(rand(5));
  # print STDERR "r: N=$N\n";
  ($t1,$t2) = @_;
  if ( $t1 =~ /^(\W*(?:\w+\W*){$N})(\w+)(\W+)(.*)/) {
    $b = $1;
    $bp = $1.$2.$3;
    $w = $2;
    $t1 = $4;
    if ( $t2 =~ /.*?(\W+${w})(\W.*)/i){
      $t2 = $2;
      return $b.$1.r($t2,$t1);
    }
    return $bp;
  }
}

# print STDERR "i: ARGV=".join(', ', @ARGV)."\n";
@texts = map{join('', qx{cat $_}) =~ s/\R/ /gr =~ s/.*?Chapter [1I]\s(.*)End of the Project G.*/\1/ir =~ s/Chapter \w+//rg} @ARGV;
# print STDERR "texts:\n".join("\n-----\n", @texts)."\n";

while( $c++<10 ){
  $t = r(@texts) =~ s/^\W+//r;
  print "$t.\n\n";
}

# i('t');

# my $N = 5;
#
# sub ss
# {
#   $N = 1 + int(rand(5));
#   my $text = shift;
#   if( $text =~ /^(\W*(?:\w+\W*){$N})(\w+)(\W+)(.*)/){
#     my $b = $1;
#     my $bp = $1.$2.$3;
#     my $w = $2;
#     my $t = $4;
#     if( $t =~ /.*?(\W+${w})(.*)/i){
#       return $b.$1.ss($2);
#     }
#     return $bp;
#   }
#   return '';
# }
#
# my $stdin = join("", <STDIN>) =~ s/\R/ /gr =~ s/.*Chapter 1 (.+)/\1/r;
#
# srand(2);
# my $c = 0;
# while( $c++ < 10 ){
#   my $t = ss( $stdin );
#   $t =~ s/\s+/ /g;
#   print "$t.\n\n";
# }
