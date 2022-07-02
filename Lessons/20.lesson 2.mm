# Lesson 2

In this lesson we shall learn to control Arty's pen.

## pen

The codeword ~~pen~~ controls the width (thickness) of Arty's pen.
It needs one number. If the number is not positive (if it is zero or
less than zero), the pen will leave no trail. If the number is positive,
the trail will be thinner or thicker based on the size of the number.

(((show me|
|90 right
0 pen 40 go
1 pen 40 go
2 pen 40 go
4 pen 40 go
8 pen 40 go)))

## color

The codeword ~~color~~ controls the colour of Arty's pen.
It also needs one number. Parts of the number are interpreted
as the values of the red, green and blue ("rgb") components of the colour.
It is handy to write such numbers in __hexadecimal__ notation:

* ~~#000~~ black
* ~~#f00~~ red
* ~~#0f0~~ green
* ~~#00f~~ blue
* ~~#ff0~~ yellow
* ~~#0ff~~ cyan
* ~~#f0f~~ magenta
* ~~#fff~~ white

(((show me|
|90 right 8 pen
#000 color 40 go
#f00 color 40 go
#0f0 color 40 go
#00f color 40 go
#ff0 color 40 go
#0ff color 40 go
#f0f color 40 go
#fff color 40 go)))

## comments

Any text that is writen between square brackets (~~[~~ and ~~]~~) is
a __comment__. Comments are meant for humans. Arty ignores them.

Comments may be very useful in explaining what the program does.

(((show me||[let us turn right...] 90 right [... and make a step] 60 go)))

## greenhouse

(((show me|
|[a green house]
#0f0 [green] color 8 [thick] pen

[outline] 100 go 45 right 71 go 90 right 71 go 45 right 100 go 90 right 100 go
[inside] 135 right 140 go 135 left 100 go 135 left 140 go
)))

## squares within a square

Draw four squares arranged in a square.

(((show me|
|[Draw a small square.]
:sq
  20 go 90 right
  20 go 90 right
  20 go 90 right
  20 go 90 right
;

[Draw a square of squares. Each square has a different colour.]
:sqsq
  #000 color 2 pen sq 0 pen 60 go 90 right
  #f00 color 2 pen sq 0 pen 60 go 90 right
  #0f0 color 2 pen sq 0 pen 60 go 90 right
  #00f color 2 pen sq 0 pen 60 go 90 right
;

sqsq)))

## do .. loop

Have you noticed how many times we had to repeat the same piece of code in the last program? If that happens, we may write a "do loop" instead. That way we can easily indicate that a piece of code should be repeated several times.

The "do loop" begins with a number which indicates how many times the loop should be repeated), followed by the codeword ~~do~~, then the repeated piece of code, and finally by the codeword ~~loop~~ that "loops" back to ~~do~~.

(((show me|
|4 do 40 go 90 right loop)))

## squares within a square, again

Let us draw again the four squares arranged in a square, but this time do it smarter.

(((show me|
|[Draw a small square.]
:sq 4 do 20 go 90 right loop;

[Draw a square of coloured squares.]
:colsq color 2 pen sq 0 pen 60 go 90 right;
:sqsq
  #000 colsq
  #f00 colsq
  #0f0 colsq
  #00f colsq
;

sqsq)))

Or even smarter: prepare the four colours (in reversed order!) and then
call the do-loop that will use one colour after another.

(((show me|
|[Draw a small square.]
:sq 4 do 20 go 90 right loop;

[Draw a square of coloured squares.]
:colsq color 2 pen sq 0 pen 60 go 90 right;
:sqsq #00f #0f0 #f00 #000 4 do colsq loop;

sqsq)))

## marker

The marker (the blue arrow) that shows the position and orientation of Arty
can be switched off and on by the keyword ~~marker~~. It needs one number.
Zero number switches the marker off, and a non-zero number, either positive or negative,
switches the marker back on.

(((show me|
|40 go
0 marker 40 go
1 marker 40 go)))

## a taste of things to come

And finally, here is something more interesting:

(((show me|
|:star 2 pen 5 do 15 right 16 go 60 right 16 go 147 left loop 0 pen;

:stars [five rows of stars]
  [starting position]
  90 left 360 go 90 right 180 go 90 right
  5 do
    [one row of stars]
    8 do star 100 go loop
    [return and down]
    180 right 800 go 90 left 100 go 90 left
  loop
;

0 pen
[red stars]
home #f00 color stars
[green stars]
home 30 right 40 go 30 left #0f0 color stars
[blue stars]
home 30 left 40 go 30 right #00f color stars)))
