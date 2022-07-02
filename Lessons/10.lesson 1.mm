# Lesson 1

**Arty** is a robot. Arty crawls around the canvas. He also has a pen. When Arty moves, the pen leaves behind a trail on the canvas. Being a robot, Arty can be __programmed__. That means that we can write a program that precisely controls what Arty does.

Each program is a sequence of __instructions__ or __commands__. A program (often simply called __code__) must be correctly __coded__, that is, written according to a given set of rules..

The upper left, yellowish panel is called __canvas__. Arty draws pictures on it. The lower left panel is the editor where we write the program. The program is in real time analysed and the individual words in it are coloured (highlighted) based on their meaning. If there is an error, the faulty word is coloured in red and the bottom bar displays an error message that explains the nature of the error.

The slider that controls the speed of the program has four positions. When it is all the way to the left, the program runs very slowly, step by step. When the slider is all the way to the right, the program runs as fast as possible.

When the checkbox that is beside the slider is checked, only the commands that draw on the canvas run step-by-step, and the remaining commands run instantaneously.

The Start / Stop / Pause / Step buttons function this way:
* **Start** starts the program. The program then runs until it ends, or until it is stopped by the Stop or Pause button.
* **Stop** stops and ends the running program.
* **Pause** interrupts the running program. The program can be then continued (Start) or executed step-by-step (Step).
* **Step** executes a single instruction.

The instruction that has just been executed is shown as selected in the editor.


# Basic commands

Arty understands four basic __commands__ (__codewords__ or simply __words__):
~~home~~, ~~left~~, ~~right~~, and ~~go~~.

## home

The command ~~home~~ brings Arty "home" -- into the centre of the canvas -- and turns him to face "north" (as on a map).

Arty starts every program from the home position. It is therefore not necessary to write ~~home~~ at the beginning of a program, but it is, of course, possible to do so.

Click the "show me" button below: it will fill the program editor with an example code. You can then click the Start button (or the Step button, repeatedly) to run the program.

(((show me||home)))

## left

~~left~~ makes Arty turn to the left.

(((try it||left)))

That did not work: the ~~left~~ command needs a number. The number tells Arty by how many degrees he should turn. It may seem strange and unusual, but in Forth (the programming löanguage) the number must go //before// the codeword ~~left~~. It is because the number is first put on the //number stack// and then the command ~~left~~ takes the number it needs from the stack.

If there is no number on the stack when it is needed, the __error message__ "no number" is shown and the program stops.

So let us put the number 90 on the stack and then use it to turn left by 90 degrees:

(((show me how to turn left||90 left)))

## right

~~right~~ works the same as ~~left~~, only in the opposite direction.

(((show me||90 right)))

## negative numbers

We can also use negative numbers. A negative number makes Arty turn the
other way. For example, ~~-90 left~~ works the same as ~~90 right~~.

(((show me||-90 left)))

## look around

Our first program will make Arty turn in all four directions: north, west, south, east, and back north.

(((show me||home 90 left 90 left 90 left 90 left)))

## numbers on the stack

Since each number is first put on the number stack and then taken from it,
we can prepare all needed numbers in advance, put them on the stack,
and then call the commands that use them.

The stack is a so-called "last in first out" (LIFO) __data structure__,
an therefore the numbers must be put on the stack in reverse order.

Execute the following program step-by-step, using the Step button. That way you can observe the numbers being put onto and taken from the stack.

(((show me||home 10 20 30 40 50 60 left left left left left left)))

## more numbers than needed

If there are more numbers on the stack than the program needs,
some numbers may remain there even after the program will have ended.
That is, usually, a sign that the program is not quite correct.

(((show me||home 10 20 30 40 50 60 left left left left left)))

## not enough numbers

On the other hand, if we do not prepare enough numbers,
the program ends with a __runtime error__ "no number".

(((show me||home 10 20 30 40 left left left left left)))

## shortcuts

Who would realy want to write the full word ~~left~~ so many times?
It is too much typing. Can we have a shorter word for it, please, for example ~~l~~?

(((let us try||90 l)))

The word ~~l~~ is yet unknown. The program did not __compile__.
The word where the error has been detected is highlighted in red, and the error message "unknown word" is shown below the editor.

## new codewords

One of the basic principles of programming is coming up with new codewords and then using them. New words must be first __defined__. If the definition of a new word describes precisely its meaning, the word is then added into the __dictionary__ of known words.

A new word definition begins with a colon (~~:~~). It is followed by the new word and then by a sequence of numbers and already known words. This sequence describes the meaning of the new word. Finally, the definition ends with a semicolon (~~;~~).

(((show me how to do it|
|:l left;

home 90 l 90 l 90 l 90 l)))

## go

Arty can ~~go~~ forward. This command needs one number that determines how far should Arty go. The distance is measured in pixels (pixel = "picture element", a dot on the screen).

(((show me||120 go)))

## drawing a square

The following program instructs Arty to draw a square and return to where he began:

(((show me||120 go 90 left 120 go 90 left 120 go 90 left 120 go 90 left)))

## more squares

What if we wanted to draw four such squares? We could define a new word, for example ~~square~~ (meaning: "draw a square") and then __call__ the word four times:

(((show me|
|:square 120 go 90 left 120 go 90 left 120 go 90 left 120 go 90 left;

square 90 left square 90 left square 90 left square 90 left)))

## shortening the code

Or, if we wished to write shorter code, we could define ~~l~~ to mean
"turn left by 90 degrees",
~~g~~ to mean "go ahead by 120 pixels", and ~~sq~~ to mean "draw a square":

(((show me|
|:l 90 left; :g 120 go;
:sq g l g l g l g l;

sq l sq l sq l sq l)))

## a taste of things to come

Let us end this first lesson by a more interesting drawing:

(((show me|
|:l 90 left;
:g 10 go; :G 40 go;

:sq g l g l g l g l;
:SQ G l sq G l sq G l sq G l sq;

:Q 45 left 80 go 45 right SQ 135 right 80 go 45 left;

:Q4 Q Q Q Q;

Q4 30 left Q4 30 left Q4)))
