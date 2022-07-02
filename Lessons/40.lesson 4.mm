# Lesson 4

In this lesson we explore ((recursion|https://en.wikipedia.org/wiki/Recursion)).We shall use it to draw a tree.

First, we introduce new features: how to compare numbers, how to run code conditionally, and how to return early from a word definition.

## eq, ne, lt, le, gt, ge

These are the keywords that compare two numbers. Each takes two numbers from the stack, compares them and then puts the result back onto the stack: it is either ~~1~~, if the comparison has been successful (true), or ~~0~~, if it was false.

* ~~eq~~ checks if two numbers are equal (=)
* ~~ne~~ checks if two numbers are //not// equal (≠)
* ~~lt~~ checks if the first number is lesser than the second one (<)
* ~~le~~ checks if the first number is lesser than or equal to the second one (≤)
* ~~gt~~ checks if the first number is greater than the second one (>)
* ~~ge~~ checks if the first number is greater than or equal to the second one (≥)

(((0 is equal to 0||0 0 eq)))
(((0 __is not__ __not equal__ to 0||0 0 ne)))
(((2 __is not__ equal to 3||2 0 eq)))
(((2 is __not equal__ to 3||2 0 ne)))
(((4 is greater than 3||4 3 gt)))
(((4 is not lesser then or equal to 3||4 3 le)))

## not

~~not~~ takes a number from the stack and puts back ~~1~~ if the number was zero, and ~~0~~ if the number was not zero.

(((0 not||0 not)))
(((1 not||1 not)))
(((-13 not||-13 not)))

## if .. then

Code that is between the codewords ~~if~~ and ~~then~~ is run //conditionally//. That means that it depends on a condition, which can be false or true. If the condition is false, then the code skipped over. If it is true, it is run.

~~if~~ takes a number from the stack. Zero means false, non-zero is true.

(((false condition||0 if 40 go then)))
(((true condition||1 if 40 go then)))

## if .. else .. then

A conditionally executed code may have two branches: if the condition is true resp. false, then the first branch (between ~~if~~ and ~~else~~) resp. the second branch (between ~~else~~ and ~~then~~) is run.

(((false condition||0 if 40 else 80 then go)))
(((true condition||1 if 40 else 80 then go)))

## end

The keyword ~~end~~ immediately ends the current word and returns from it "early".

(((show me|
|:early 20 go end 90 right;
early)))

We shall use ~~end~~ in connection with ~~if~~..~~then~~.

# Tree

Trees are self-similar, recursive structures. That is, smaller parts of a tree themselves resemble (have a shape similar to) smaller trees.

Below are incremental steps that lead toward painting a tree.

First, we write a definition of the word ~~tree~~ that shall, eventually, draw a tree. It expects one number to determine how big the tree should be. The number stays on the stack after ~~tree~~ has finished.

This first iteration of ~~tree~~ only draws only a short line. It is the first segment of the tree, its trunk. From the trunk should then grow other segments: the branches, twigs, and leaves of the tree:
(((1|
|:tree dup go;
60 [tree size]
tree
drop [cleanup])))

Notice that ~~tree~~ not only does not change the contents of the stack, it also returns Arty where he has been before that:
(((2|
|:tree
  dup go [go ahead]
  dup neg go [back up]
;

60 tree drop)))

At the end of the segment, Arty turns left (where the next segment shall be), then right, then back to the middle, before backing up to his original position:
(((3|
|:a 30; [angle]

:tree
  dup go
  a left
  a 2 mul right [add the two angles together]
  a left
  dup neg go
;

60 tree drop)))

The next segments of the tree should be shorter. We prepare a "shrunk" copy of the original number on the stack, do the turning around, drop the copy of the number (it is important to always clean after ourselves) and return:
(((4|
|:a 30;
:sf 2 3 div; [shrink factor, 2/3]

:tree
  dup go
  dup sf mul [the shrunk copy]
  a left
  a 2 mul right
  a left
  drop [cleanup]
  dup neg go
;

60 tree drop)))

And now comes **The Magic Moment**. At the end of the segment, as Arty looks left, right, and back in the middle, we call the word ~~tree~~ //recursively//:
(((5|
|:a 30;
:sf 2 3 div;

:tree
  dup go
  dup sf mul
  a left tree [recursion]
  a 2 mul right tree [recursion]
  a left
  drop
  dup neg go
;

60 tree drop)))

But it did not work. This was an uncontrolled, //infinite// recursion. Properly working recursion must eventually end. We shall do it, when the length of the next layer of tree segments becomes too short:
(((6|
|:a 30;
:sf 2 3 div;
:shortest 10; [the limit of the segment length]

:tree
  [if shorter than shortest, return early]
  dup shortest lt if end then
  [otherwise continue]
  dup go
  dup sf mul
  a left tree
  a 2 mul right tree
  a left
  drop
  dup neg go
;

60 tree drop)))

Voilà!

But the tree is very symmetric and wiry. In nature, especially where the wind blows, trees lean in the prevailing direction of the wind, and the trunk is usually thicker than branches. We also make the tree denser by adding a middle branch:
(((7|
|:a 30;
:lean 15;
:shrink 50 36 div;
:shortest 10;
:bt 6; [ratio of thickness - length/width]

0 marker [yes!]

:tree
  dup shortest lt if end then
  dup bt div pen dup go
  dup shrink div
    a lean add left tree
    a 2 mul right   tree
    a lean sub left tree
  drop
  dup neg go
;

80 tree drop)))

Wow! A tree at night.

Last, let us add colours and bend the trunk and branches a little:
(((8|
|:a 40;
:lean 15;
:bend 5;
:shrink 50 36 div;
:shortest 10;
:bt 6;

0 marker

[colours]
:col
dup 20 lt if #093 color end then [shortest things are green]
dup 40 lt if #854 color end then [longer are light brown]
#743 color; [and the rest is darker brown]

:tree
  col
  dup shortest lt if end then
  dup bt div pen dup go
  dup shrink div
    bend right      tree
    a lean add left tree
    a 2 mul right   tree
    a lean sub left
    bend left
  drop
  dup neg 0 pen go
;

0 pen -120 go
80 tree drop)))

All done for now.
