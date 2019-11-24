#!/usr/bin/perl
# N=6
sub ss
{
  my $w = $_[0];
  print STDERR "DEBUG: in ss: w=${w}\n";
  my $text = $_[1];
  if( $text =~ /.*?\W+${w}\W+((?:\w+\W*){5})(\w+)(\W+)(.*)/i ){
    print STDERR "DEBUG: 1='".$1."'\n";
    print STDERR "DEBUG: 2='".$2."'\n";
    print STDERR "DEBUG: 3='".$3."'\n";
    return $1.$2.$3.ss($2, $4);
  }
  return '';
}

my $stdin = join("", <STDIN>);
$stdin =~ s/\R//g;
print ss( 'acknowledged', $stdin );
