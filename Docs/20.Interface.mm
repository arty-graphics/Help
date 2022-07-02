# Interface

The complete system of Arty runs as a web browser single-page-application (SPA). Its interface is quite simple (click on the image to open it in a separate browser tab):

(([[+api/help/Docs/ui.png|100%]]|+api/help/Docs/ui-annotated.png))

The interface has three panels: on the left are the canvas and the code editor with the program. On the right is a navigable documentation.

Between the code editor and canvas is a bar that contains a slider that controls the speed of a running program, from a very slow speed to instant execution of the program. Next, there is a check box. If it is checked, then the program runs faster -- commands that do not draw on the canvas will be executed very fast.

The bar also contains three combos that show, in real time, the contents of the three stacks: the program stack, the number stack, and the control stack.

Below the code editor is a bar with four buttons -- start, stop, pause, step -- that control the execution of the program. If there is any error -- either in the program syntax, or when the program runs -- the error message will be also displayed in this bar.

There is a small blue arrow on the canvas.
It represents the turtle position and orientation:
[[+api/help/Docs/arty.svg|1.4em]]
