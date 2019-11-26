#!/usr/bin/perl
# use Data::Dumper qw(Dumper);

$remainings = [
["I", "We", "You"],
["ran", "went","go"],
["to", "by"],
["the", "a"],
["red","blue","grey"],
["egg", "ball"],
["with", "for"],
["your", "our"],
["pal", "chum", "bud"],
["or"],
["enemy", "foe"],
];

# print "remainings: ";
# print Dumper $remainings;

sub p
{
  my $sentence = shift;
  my $i = shift;
  my $words = $remainings->[$i];

  if (scalar $words == 0) {
    print "${sentence}.\n";
    return
  }
  map { p("$sentence $_", $i+1) } @$words;
}

p("",0);
