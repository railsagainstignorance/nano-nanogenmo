#!/usr/bin/perl
my $N = 5;

sub ss
{
  $N = 1 + int(rand(5));
  my $text = shift;
  if( $text =~ /^(\W*(?:\w+\W*){$N})(\w+)(\W+)(.*)/){
    my $b = $1;
    my $bp = $1.$2.$3;
    my $w = $2;
    my $t = $4;
    if( $t =~ /.*?(\W+${w})(.*)/i){
      return $b.$1.ss($2);
    }
    return $bp;
  }
  return '';
}

my $stdin = join("", <STDIN>) =~ s/\R/ /gr =~ s/.*Chapter 1 (.+)/\1/r;

srand(2);
my $c = 0;
while( $c++ < 10 ){
  my $t = ss( $stdin );
  $t =~ s/\s+/ /g;
  print "$t.\n";
}
