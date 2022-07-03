# Lesson 5 - Advanced features

## Other codewords that control Arty are:

~~push~~ remembers Arty's position and direction.

~~pop~~ restores Arty's position and direction.

~~arc~~ moves Arty along an arc. It needs two numbers: the arc radius and angle.

(((arc left||40 60 arc))) (((arc right||40 -60 arc)))

Negative radius is the same as the zero radius:

(((left||-40 60 arc))) (((right||-40 -60 arc)))

## Codeword parameters:

The numbers that a word expects to find on the stack can be specified as named parameters in the word definition. The parameters function as temporarily defined words and their corresponding values will be taken from the stack.

(((show me||[turn by angle a and go by d]
:w (a d) a left d go;
30 100 w)))
