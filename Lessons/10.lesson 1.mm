# Lesson 1

**Arty** is a robot that crawls around on the canvas. Arty has a pen. When Arty moves, the pen leaves behind a trail on the canvas. Being a robot, Arty can be __programmed__. That means that you may write a program that precisely controls what Arty does.

A program is a sequence of __instructions__ or __commands__. The program (often simply called __code__) must be correctly __coded__, that is, written according to a given set of rules.

As you write the program in the editor area, it is being analysed in real time  and the individual words and symbols in it are coloured (highlighted) according the their meaning. If there is an error in the code, the wrong word or symbol will be coloured in red and an error message that explains the nature of the error displayed below the editor.

The slider that controls the speed of the program has four positions. When it is all the way to the left, the program runs very slowly, step by step. When the slider is all the way to the right, the program runs as fast as possible.

When the star-like checkbox left to the slider is checked, only the commands that draw on the canvas will run step-by-step. Other commands wil be executed instantaneously.

The Run / Stop / Pause / Step buttons function this way:
* **Run** starts or continues the program. The program will runs until it ends, or until it is stopped by the Stop or Pause button.
* **Stop** stops and ends the running program.
* **Pause** stops but does not end the running program. The program can be then continued (Start) or executed step-by-step (Step).
* **Step** executes a single instruction.

The instruction that has just been executed is selected in the editor.

# Basic commands

Arty understands four basic __commands__ (called __codewords__ or simply __words__):
~~home~~, ~~left~~, ~~right~~, and ~~go~~.

## home

The command ~~home~~ brings Arty "home" -- into the centre of the canvas -- and turns him to face "north" (that means up, as if the canvas were a map).

Arty starts every program from the home position. It is therefore not necessary to write ~~home~~ at the beginning of a program, but it is, of course, possible and allowed to do so.

Click the "show me" button below: it will fill the program editor with the sample code. You may then click the Run button (or the Step button, repeatedly) to run the program.

(((show me||home)))

## left

~~left~~ makes Arty turn to the left.

(((try it||left)))

That did not work: the program has not run and an error message appeared below the editor area. That happened beacuse the ~~left~~ command needs a number (also called an __value__), to know how big the turn should be -- by how many degrees should Arty turn. It may seem strange and unusual at first, but in Forth, unlike in most other programming languages, values must go //before// the command (codeword) that need them. They will be placed on the //number stack// and then the command takes what it needs from the stack.

If one or more numbers are needed by a command, but there are none on the stack, the __error message__ "no number" is shown and the program stops.

Let us then put the number 90 on the stack and then use it to turn left by 90 degrees:

(((show me how to turn left||90 left)))

## right

~~right~~ works the same as ~~left~~, only in the opposite direction.

(((show me||90 right)))

## lf, rg

Because the turning commands ~~left~~ and ~~right~~ are usually used quite often, there or shorter versions: ~~lf~~ and ~~rg~~ that work exactly the same as the full words.

## negative numbers

Negative numbers makes Arty turn in the opposite direction. For example, ~~-90 left~~ works the same as ~~90 right~~.

(((show me||-90 left)))

## fractional numbers

Fractional numbers can be also used. They are writen the ususal way, e.g. ~~3.14~~ or ~~-9.80~~

## turn around

This very simple program makes Arty turn in four directions: north, west, south, east, and back north.

(((show me||home 90 left 90 left 90 left 90 left)))

## numbers on the stack

Since commands that require numbers take them from the number stack, the numbers can be prepared in advance, and put on the stack earlier that they are needed.

The stack is a so-called "last in, first out" (LIFO) __data structure__, that is, the number that will be used first must be the last to placed on the stack. Therefore if there are more numbers used, they must be put on the stack in reverse order.

Execute the following program step-by-step, using the Step button. That way you can observe the numbers being put onto and taken from the stack.

(((show me||home 10 20 30 40 50 60 left left left left left left)))

## more numbers than needed

If there are more numbers on the stack than the program needs,
some numbers may remain there even after the program will have ended.
That is, usually, a sign that the program is not quite correct.

(((show me||home 10 20 30 40 50 60 left left left left left)))

## not enough numbers

On the other hand, if we did not prepare enough numbers,
the program ends with a __runtime error__ "no number".

(((show me||home 10 20 30 40 left left left left left)))

## shortcuts

The command ~~left~~ has a shorter variant ~~lf~~. What if we wanted to have even a shorter word for it, for example ~~l~~?

(((let us try||90 l)))

The word ~~l~~ is yet unknown. The program did not __compile__.
The word where the error has been detected is highlighted in red, and the error message "unknown word" is shown below the editor.

## new codewords

One of the basic principles of programming is making up new codewords, assigning them their precise meaning, and then using them. That is done by new word __definition__. The new, defined word is then added into the __dictionary__ of known words and can be used in the program.

The new word definition begins with a colon (~~:~~). The colon is followed by the word that is being defined, then by a sequence of numbers and already known words, and ends with a semicolon (~~;~~). This sequence of numbers and words between ~~:~~ and ~~;~~ describes the meaning of the new word.

Let us define ~~l~~ as a one-letter shortcut for ~~left~~:

(((show me how to do it|
|:l left;

home 90 l 90 l 90 l 90 l)))

## go

Arty can ~~go~~ forward. The command ~~go~~ needs one number to determine how far should Arty go. The distance is given in pixels (pixel = "picture element", a dot on the screen).

(((show me||120 go)))

## drawing a square

The following program instructs Arty to draw a square and return to the beginning:

(((show me||120 go 90 left 120 go 90 left 120 go 90 left 120 go 90 left)))

## more squares

What if we wanted to draw four such squares? We could define a new word, for example ~~square~~ (meaning: "draw a square") and then __call__ the word four times, turning by 90 degrees between each two squares:

(((show me|
|:square 120 go 90 left 120 go 90 left 120 go 90 left 120 go 90 left;

square 90 left square 90 left square 90 left square 90 left)))

## shortening the code

Or, if we wished to write much shorter code, we could define ~~l~~ to mean
"turn left by 90 degrees",
~~g~~ to mean "go ahead by 120 pixels", and ~~sq~~ to mean "draw a square":

(((show me|
|:l 90 left; :g 120 go;
:sq g l g l g l g l;

sq l sq l sq l sq l)))

Of course, programs written with the use of shortcuts are more difficult to understand.

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
