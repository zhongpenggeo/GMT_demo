#!/bin/bash

RR=R70/110/15/45
RZ=R70/110/15/45/-4000/5000
JJ=JM10c
JZ=JZ4c
CPT=etopo1
GRD=Tibet_topo.grd
ILLU=topo.i

for ((num=2; num<360; num=num+5))
do
    gmt begin 
    gmt figure topo3D_${num} png A2c
    gmt set MAP_FRAME_TYPE=fancy
    
    gmt psbasemap -$RZ -$JJ -$JZ -p${num}/40 -B5  -BSEnw 
    gmt grdview $GRD -$JJ -$JZ -$RZ    -Qi500 -N-4000+ggray -C$CPT -p${num}/40
    gmt end
done    
gmt clear all
convert -delay 1 -loop 0 topo3D*.png topo3D.gif
