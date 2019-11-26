# NaNo-NaNoGenMo

see https://nickm.com/post/2019/11/nano-nanogenmo-or-nnngm/ for context

but basically, the task is to generate a 50k+ word novel using code consisting of no more than 256 chars, and you may use text from Project Gutenberg.


## First stab: SpliceSkip algorithm (2019/11/24)

The output is in spliceSkip_PrideAndPejudice.txt.

This example of a generated novel has been [submitted to the NaNoGenMo initiative](https://github.com/NaNoGenMo/2019/issues/114).

To generate this output, run the file, invokeSpliceSkip.sh. This invokes the minified perl script on the full, plain text of Pride and Prejudice by Jane Austen from Project Gutenburg (which is in a file named 't'). Should work with other texts from the same collection.

The full code is

`perl -e'sub f{$N=1+int(rand(5));if(shift=~/^(\W*(?:\w+\W*){${N}})(\w+)(\W+)(.*)/){$b=$1;if($4=~/.*?(\W+${2})(.*)/i){return$b.$1.f($2);}return$1.$2.$3;}}$_=join("",<>);s/\R/ /g;s/.*Chapter 1 (.+)/\1/;while($c++<2500){$T=f($_)=~s/\s+/ /gr;print"$T.\n\n";}' t`

and uses 256 characters.

As far as I can tell, this is within the word and spirit of the Nano-NaNoGenMo rules. The source text file is lifted verbatim from Project Gutenberg, and is used with no preprocessing, albeit renamed to 't'.

### Sample output

`It is a truth universally acknowledged to be pretty, but she asked him at last how it was; everybody says that Mrs. Long does not mind .” “His pride,” said . Miss Bennet’s pleasing manners grew on the public places. The country , is it not, Mr. Darcy. her eyes towards him and said: “ bye, Charles, are you, before you determine on in a different manner; but therefore in each other’s confidence, , and if the second, I sit by the fire.” “Oh! shocking! He deserves to be—but it shall not been his motive? What can have borne with me better motive, that he should have , and they continued talking together, with her head full of him. she had lost and the civility of Mrs. Phillips, protesting that he crowded his cousins, had more easily believe Mr. . Bingley, if he _had been_ -imposed. “I foundation is unjust. Caroline is incapable of triumphing in Miss Bingley’ sister, though the same circumstances, she thus went on: “I am in the least unwilling to think him less agreeable. Sir William Lucas who had been little used to have her judgement controverted. , she addressed a variety of questions to the latter walked away from her, and making the tour of the park, she turned up the lane, she was tempted, by that time in the hope of meeting him accidentally in Hertfordshire . But no such recollection befriended her. she could remember no more substantial good health, and indignation would she have said? how would she amused herself. Their first subject was necessary, which Elizabeth believed that the happy spirits, amidst the various were the subjects , that anybody might have heard not a word. . She dreaded seeing Mr. Darcy and herself. .” Miss Bennet paused a little, ; and if is so violent hurry, as Mrs. Forster, to inform us that she was sent off from B. intending to marry her. Wickham has every charm of person ? And who is there, whatever might been profligate in . Every girl interesting subject, by its repeated by the others, and they all repaired, after a few days more we may gain some partiality, especially as the time can remove. not be guilty of all the others; for who, as much as likely to give any other excuse for the lowness of Darcy, she could have borne the appearance of his usual philosophic .

It is a truth universally acknowledged to be pretty women in the prettiest? and his answering immediately to nothing, you know.” “_My_ overhearings were you.” “, I may safely promised her some draughts to Netherfield , because on such particular civility as to say !” Nothing that she could say, , however, Mrs. . Bennet himself, while his wife seriously commended, first by him of his daughter’s being most active magistrate into their differences, silence . Their other engagements were few weeks, and though . There were two nephews of Lady Catherine or her daughter. . Colonel Fitzwilliam seemed really glad to him at Rosings; and Mrs. . Collins has nobody’s way, you know, instrument. He drew a chair a little towards her sister, just as he pleases.” “And if not know anybody who seems more to have his own way very well for the present, and, as she has the true Darcy spirit, she spoke she supposed Miss Darcy likely to give you reasons for this interference?” “ I have now told you.” Elizabeth made it clearer attention a relation of events, determining probabilities, and reconciling herself so dull as to make her. Elizabeth could not seemed to feel it most acutely did ! She was wild to be upon the spot. She had no fear of its being three months,” she cried, “when shall we meet again to the agitation on seeing it was extreme. she sat in misery till the storm .
`

### Notes

- to use Pride and Prejudice by Jane Austen, https://www.gutenberg.org/ebooks/1342.
- strip out 'Chapter X' and intro words to just have story paras
- grab the block of the 1st N words, then jump to the next usage of the final word of that block, grab the next N words, and repeat.
- if we finish before 50k words, start again with a different N
- possibly have N be generated randomly each time

e.g.
N=6
It is a truth universally acknowledged, [... acknowledged] to be pretty,
but she smiled [...smiled] . “Your friend performs delightfully,” he
continued [...continued] ...

### Version 1: kicked off by the word 'acknowledged'.

$ perl spliceSkip.pl < 1342-0-cropped.txt

that a single man in      possession before      Michaelmas, and some of his name?”      “Bingley.”      “Is he married or five thousand a year. What a woman has five grown-up daughters, Only think what an establishment it      will be      impossible for _us_ to see you; and I will send her home.”      “Oh! but the gentlemen being out, they had, in fact,      much better fitted for a walker could go no farther, and thought she, “when he knows who they      walked on together. After a short sentence when there was least danger from the deception never entered my thoughts.”      “When they all removed to believe them fond of each other?”      “could      detain them from it long, expectations.      The little Gardiners, attracted by the approach of the whole party. were in hopes of a letter from him; it told them that, Mr. Bennet had been to Epsom

### Version 2: no initial word. Random-sized jump (1-6) for each iteration, so always diverges. Loops and starts again until > 50k words

$ perl spliceSkip.pl < 1342-0-cropped.txt

It is so well fixed invitation enough. “Why, my dear, young man of England; tha
t he came from there is the most beautiful creature I . Everybody said how well
she was the only established as at his table— nor of its office.” “ your admirat
ion of her fine eyes.” “ not make them; but suspecting them to cards?” said her
quite well.” Elizabeth thanked him that , she drew near the card- tables, cover
screens, .

It is so well fixed invitation enough. “Why, my dear, young man of England; tha
t he came down one of them.” “ is very likely that. You and the girls may go and
see Mr. Bingley when there are -twenty years had been insufficient to make any
reply to the instrument by her sister Mary, , who, with some thought of fixing i
n -town indifference to decorum, and she could not help saying: “Oh, that my mem
ory as the most eligible match; and esteem for our cousins health and happiness
against it; and, therefore, , I would have you be on _your_ resolution and good
conduct, is being serious likewise.” “Well, then, you need not be in love with m
e—I believe

### Version 3: minified spliceSkip.pl into s.pl

same functionality

It is a truth universally acknowledged to be pretty, but she smiled. “Your friend performs delightfully situated through, in a very different nature, and by no means of varying the humble home scene between Mr. . Darcy should have delivered on paper his perfect approbation of rage which had produced his activity .

It is acknowledged, that a single?” “Oh! Single, my dear, to . Bennet,” ,” replied he; “they are all silly. If I wished to think slightingly .
It is acknowledged, that a single man may . Bennet,” said his wife impatiently. “.” “_You_ are dancing with the room,” said Mr. . Darcy walked off; and Elizabeth remained , with great spirit among her eldest daughters, was entailed, in default .

It is a truth universally acknowledged to be pretty, but she asked him at last how it was; everybody says that Mrs. Long does not keep a pack of wine a day.” “Then you ought,” said Mrs. Hurst ; and though the younger sisters, who, with Lady Lucas.” , he was struck with the action of dancing. I moved this gentleman dislikes the inducement, my dear Miss Eliza, were usually tempted me further by his gift. . He meant to provide for me no hope from -law said, in listening to Lady Catherine talk, which she did not you all learn? You ought to beg his own arts,” said , Fitzwilliam asked her why she was he to be the propriety of the particulars immediately following of . Wickham’s charge, exceedingly shocked her; the ——shire Militia, in which he , had there renewed a slight acquaintance—an acquaintance, I have made a stronger impression on his parting obeisance, was able to do so. lady from whom they walked down the gardener, who met them , at least of surprise, only ten minutes sooner, they should even speak to her family! Never in her hand! she answered mechanically to direct . Her thoughts were all fixed on that it was ten miles round. its narrowest .

## Third stab: Permute algorithm (2019/11/26)

The output is in permute.txt.

See invokePermute.sh for how it works.

```
 I go by our grey cup for my pal.
 I go by our grey cup for my owl.
 I go by our grey cup for my bud.
 I go by our grey cup for my dog.
 I go by our grey cup for my set.
 I go by our grey cup for your pal.
 I go by our grey cup for your owl.
 I go by our grey cup for your bud.
 I go by our grey cup for your dog.
 I go by our grey cup for your set.
 We ran to the red egg of my pal.
 We ran to the red egg of my owl.
 We ran to the red egg of my bud.
 We ran to the red egg of my dog.
 We ran to the red egg of my set.
 We ran to the red egg of your pal.
 We ran to the red egg of your owl.
 We ran to the red egg of your bud.
 We ran to the red egg of your dog.
 We ran to the red egg of your set.
 etc
```
