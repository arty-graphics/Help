# Lesson 3

In this lesson we shall learn how to do basic arithmetic -- that is, how to work with numbers.

## Forth with Reverse Polish Logic

Arty's language is based on the ((Forth|https://en.wikipedia.org/wiki/Forth_(programming_language))) programming language.
Forth is a //stack-based// language; it uses stack as its primary storage. Stack is a LIFO/FILO data structure and reverses the order of data. For arithmetic operations done with the help of a stack, it is practical to use ((Reverse Polish notation (RPN)|https://en.wikipedia.org/wiki/Reverse_Polish_notation)), also called __Reverse Polish Logic__ or __postfix__ notation.

For example, to add two numbers 1 and 2 in RPN, we would write "**1 2 +**" instead of the usual "**1 + 2**".

## add, sub, mul, div, neg

Arty knows these codewords that work with numbers:
* ~~add~~ adds two numbers
* ~~sub~~ subtracts one number from another
* ~~mul~~ multiplies two numbers
* ~~div~~ divides two numbers, and
* ~~neg~~ negates a number.

## add

To add two numbers, put them on the stack and call ~~add~~. The two numbers will
be taken from the stack and their sum will be put back onto the stack.

(((show me||1 2 add)))

To add more numbers together, put them all onto the stack and then call ~~add~~ as many times as needed (that is once less than there are numbers):

(((this way||1 2 3 4 5 6 add add add add add)))
(((or so||1 2 add 3 add 4 add 5 add 6 add)))
(((or so||1 2 3 add add 4 add 5 6 add add)))
(((or even so||1 2 3 4 5 6
5 do add loop)))

## sub

Subtracting 2 from 3 gives 1 (((show me||3 2 sub))),
subtracting 3 from 2 gives -1 (((show me||2 3 sub))).

## mul, div

Multiplication is done similarly (((show me||3 4 mul))), and so is division (((show me||3 4 div))).

## division by zero

Division by zero gives an infinite number, "Infinity". But this number cannot
be really used for drawing, so do not do it (do not divide by zero).

(((infinity||3 0 div)))
(((negative infinity||-3 0 div)))

## neg

~~add~~, ~~sub~~, ~~mul~~, and ~~div~~ are __binary__ operations: they take **two** operands and produce one result.

~~neg~~ negates a number (it inverts its sign). It is a __unary__ operation: it takes **one** operand and produces a result.

(((negate a number||3 neg)))

# dup

~~dup~~ ("duplicate") is an interesting codeword. It takes a number from the stack and puts back **two** copies of the same number.

(((show me||7 dup)))

Why would we need it? It is useful in many situations. For example, to calculate a square (the second power) of a number.

(((four squared||4 dup mul)))

~~dup~~ is also very useful if we need to use a number and at the same time to keep it, for example when:

# drawing a spiral
Now we know all that we need to (((draw a spiral|
|0 [begin with a zero length]
180 do [the spiral will have this many segments]
  dup go   [make a copy of the current length and use it for go]
  90 right [turn]
  2 add    [the next segment should be longer]
loop
)))

We make the spiral-drawing program more user-friendly, by extracting the various parameters, giving them human-readable names, and putting them at the beginning of the program.

(((show me|
|:numSegments 180;
:turnAngle    90;
:growSegment  2;

0 numSegments do
  dup go turnAngle right
  growSegment add
loop)))

And now we can easily **experiment** with different parameter values.

(((1||:numSegments 360;
:turnAngle   60;
:growSegment 1;

0 numSegments do
  dup go turnAngle right
  growSegment add
loop))) (((2||:numSegments 120;
:turnAngle   61;
:growSegment 2;

0 numSegments do
  dup go turnAngle right
  growSegment add
loop))) (((3||:numSegments 220;
:turnAngle   170;
:growSegment 2;

0 numSegments do
  dup go turnAngle right
  growSegment add
loop))) (((4||:numSegments 420;
:turnAngle   -8;
:growSegment 1 10 div;

0 numSegments do
  dup go turnAngle right
  growSegment add
loop)))

# drop

~~drop~~ simply takes one number off of the stack and discards it. It is a counterpart of ~~dup~~. In the spiral-drawing program above we started with putting a number ~~0~~ on the stack. After the program had finished, there still remained one number on the stack. To make the program "clean after itself", we ~~drop~~ the number.

(((show me||:numSegments 120;
:turnAngle   61;
:growSegment 2;

0
numSegments do
  dup go turnAngle right
  growSegment add
loop
drop)))

That's all for this lesson.
