# Lesson 2

In this lesson we shall learn to control Arty's pen.

## pen

Arty can lift the pen up from the canvas (~~pu~~) and put it back down (~~pd~~).

(((show me|
|10 go pu 10 go pd 10 go pu 10 go pd 10 go)))

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

If the set width of Arty's pen is 0 (or less), Arty lifts the pen up. If the width is greater than 0, Arty puts the pen down.

(((show me|
|10 go pu 10 go 1 pen 10 go -1 pen 10 go)))

## color

The codeword ~~color~~ controls the colour of Arty's pen.
It also needs one number. The number is interpreted as a combination of the red, green and blue ("rgb") components of the colour.
It is handy and common to write such numbers in __hexadecimal__ notation:

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

Comments are useful to explain what the program does.

(((show me||[let us turn right...] 90 right [... and go ahead] 60 go)))

## greenhouse

(((show me|
|[a green house]
#0f0 [green] color 8 [thick] pen

[outline] 100 go 45 right 71 go 90 right 71 go 45 right 100 go 90 right 100 go
[inside] 135 right 140 go 135 left 100 go 135 left 140 go
)))

## squares in a square

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
  #000 color 2 pen sq pu 60 go 90 right
  #f00 color 2 pen sq pu 60 go 90 right
  #0f0 color 2 pen sq pu 60 go 90 right
  #00f color 2 pen sq pu 60 go 90 right
;

sqsq)))

## do .. loop

Have you noticed how we had to repeat the same piece of code in the last program? When that happens, we should write a "do loop" instead. That way we can easily express that the same piece of code should be repeated several times.

The "do loop" starts with a number which indicates how many times the loop should be repeated ("the repetition count"), followed by the codeword ~~do~~, then the piece of code to be repeated, and ends with the codeword ~~loop~~ that "loops" back to ~~do~~.

(((show me|
|4 do 40 go 90 right loop)))

## squares in a square, again

Let us draw the four squares arranged in a square again, but this time do it smarter.

(((show me|
|[Draw a small square.]
:sq 4 do 20 go 90 right loop;

[Draw a square of coloured squares.]
:colsq color 2 pen sq pu 60 go 90 right;
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
:colsq color 2 pen sq pu 60 go 90 right;
:sqsq #00f #0f0 #f00 #000 4 do colsq loop;

sqsq)))

## cnt

~~cnt~~ places the current loop count onto the number stack.

## marker

The blue-arrow marker that shows the position and orientation of Arty
can be switched off and on using the keyword ~~marker~~. It needs one number.
Zero switches the marker off, and a non-zero number, either positive or negative, switches the marker back on.

(((show me|
|40 go
0 marker 40 go
1 marker 40 go)))

## a taste of things to come

And finally, here is again something more interesting:

(((show me|
|:star 2 pen 5 do 15 right 16 go 60 right 16 go 147 left loop pu;

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

pu
[red stars]
home #f00 color stars
[green stars]
home 30 right 40 go 30 left #0f0 color stars
[blue stars]
home 30 left 40 go 30 right #00f color stars)))
