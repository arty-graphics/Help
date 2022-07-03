# Gallery

This is a place for interesting contributed programs.

(((Square Spiral|help/Gallery/sq-spiral.png
|:n 200; :a 89;
n do n cnt sub go a right loop)))

(((Circle Spiral|help/Gallery/circ-spiral.png
|:n 70; :a 119;
n do n cnt sub 360 arc a right loop )))

(((Star|help/Gallery/star.png
|20 do
  100 go
  cnt 2 mod if 175 else 225 then left
loop)))

(((Tree|help/Gallery/tree.png
|:a 40;
:lean 15;
:bend 5;
:shrink 1.39;
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

(((Ball|help/Gallery/ball.png
|:size 140;:n 21;

:l 90 left;:g 0 pen go 1 pen;:s2 size 2 div;
:circle dup g l dup 360 arc l dup g l l;

size circle
n do 360 n div left s2 g s2 circle l l s2 g l l loop)))

(((Snail|help/Gallery/snail.png
|:d 0.7;:n 199;
:sq 4 do dup go 90 left loop;
#00b color
d n do dup sq d add 543 n div left loop)))

(((Koch snowflake|help/Gallery/koch-snowflake.png
|:k (d n) d n 0 le if go else 3 div n 1 sub K then;
:K (d n) d n k l1 d n k r2 d n k l1 d n k;
:f (n d) d c d n K r2 d n K r2 d n K r2;
:l1 60 left; :r2 120 right;
:c (d) home 0 pen d 1.5 mul neg go 90 left d 0.87 mul go 90 right 1 pen;
4 do cnt dup 30 mul f loop)))

(((Sierpinski triangles|help/Gallery/sierpinski.png
|:l 120 left;:r 120 right;
:t (d) 3 do d go l loop;
:q (d) d d 8 le if t else 2 div T then;
:T (d) d q d go d q l d go r d q r d go l;
:x (d) 6 do d T 60 left loop;
90 right 120 x)))

(((Donut|help/Gallery/donut.png
|:d 4; 360 d div do 100 360 arc d go d right loop)))

(((Wings|help/Gallery/wings.png
|:r 90;:n 170;:q 30;
:t (a) a 2 div 3 mul 90 add;
:l (a) a 180 sub q div abs 1 sub r mul;
:g (a) home 0 pen a left r go a t right 1 pen a l go;
n do 360 n 1 sub div cnt mul g loop)))

(((Hilbert curve|help/Gallery/hilbert.png
|:s 8; :g s go;
:l (a) a lf; :r (a) a rg;
:Y (x a) x 1 sub a X;
:X (x a)
  x 0 le if a a a a l g r g r g l end then
  a x a a x a x a a x a a
  l neg Y g r Y g Y r g neg Y l
;

3 90 X)))

(((Flower|help/Gallery/flower.png
|0 pen -200 go 90 right -150 go 90 left 1 pen
:m 2 do 9 do 5 go 10 rg 5 go loop 90 rg loop ;
#00b color 2 do 400 go 90 right 300 go 90 right loop
0 pen 90 rg 150 go 90 lf 30 go 2 pen
#0f0 color
m 90 lf m
90 rg 200 go #f00 color
10 do m 36 rg loop 0 marker)))
