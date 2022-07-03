# Interface

The complete system of Arty runs as a "single-page-application" (SPA) in a web browser. It has a simple interface:

(([[+api/help/Docs/ui.png|100%]]|+api/help/Docs/ui-annotated.png))

The interface has three panels: on the left are: the canvas, the program code editor and two bars with various control elements. On the right is a navigable documentation.

The bar between the canvas and the code editor contains a slider that controls the speed of the running program, from a very slow to instant execution of the program. To the left it has a star-shaped switch. When it is selected, the program runs faster, because it will execute very fast the commands that do not draw on the canvas.

The bar also contains three combos that show, in real time, the contents of the three stacks: the program stack, the number stack, and the control stack.

Below the code editor is a bar with four buttons -- run, stop, pause, step -- that control the execution of the program. If there is any error -- either in the program syntax, or during the program run -- an error message will be also displayed in the space next to the buttons.

The small blue arrow on the canvas [[+api/help/Docs/arty.svg|1.4em]] represents the turtle position and orientation.
