#!/usr/bin/perl
# use Data::Dumper qw(Dumper);

$L="like";
$T="them";
$DYL="Do you $L";
$IDNL="I do not $L";
$IDNLT="$IDNL $T";
$WY="Would you";
$WYLT="$WY $L $T";
$WYET="$WY eat $T";
$N="Not";
$IWNET="I would not eat $T";
$SIA="Sam-I-am";
$GEAH="green eggs and ham";
@IAWA=(
["house","mouse"],
["box","fox"],
["car","bar"],
["tree","bee"]
);
$TY="Thank you";

sub v
{
  $hr=shift;
  $p=shift;
  if($p ne ""){
    ($IA,$WA)=@$p;
    ($IAF,$WAF)=("in a $IA","with a $WA");
    print "\n$WYLT $IAF?\n$WYLT $WAF?\n\n$IWNET $IAF.\n$IWNET $WAF.\n";
    @h=@$hr;
    map{print "Not $_\n"}@h;
    push(@h,($IAF,$WAF));
    print "$IDNLT, $SIA.\n$IDNL $GEAH.\n";
    return v(\@h,@_);
  } else {
    print "Say!\nI like $GEAH!\nI do! I like them, $SIA!\nSo, ";
    map{print "I would eat them $_.\n"}@$hr;
    print "I do so like $GEAH!\n$TY!\n$TY, $SIA.\n";
  }
}

print "$DYL $GEAH?\n\n$IDNLT, $SIA.\n$IDNL $GEAH.\n";
v([],@IAWA);
