#!/bin/bash

RR=R70/110/15/45
RZ=R70/110/15/45/-4000/5000
JJ=JM10c
JZ=JZ4c
RRsub=R60/140/4/60
DD=D70/110/15/45
JJsub=JM1.5i
PS=topo3D_2.ps
CPT=etopo1.cpt
GRD=Tibet_topo.grd
RANGE=-550/380/20
ILLU=topo.i
pp=p0/40

gmt set MAP_FRAME_TYPE=plain

gmt psxy -$JJ -$RR -T -K -P  >$PS
#gmt grdgradient $GRD -A135 -Nt -G$ILLU
#gmt grdimage $GRD -$RR -I$ILLU -Ba10f5g10 -BNWse -$JJ -C$CPT  -K -V -P >$PS
#gmt grdcontour $GRD -$JJ -C100  -S4  -W0.25p,gray20  -V -K  -O >>$PS
#gmt pscoast -$RR -$JJ -Ba10f5g5 -BNWse -N1/0.5p,black -W1/0.5p,black -K -O >>$PS
# insert map
#gmt pscoast -$RRsub -$JJsub -B0 -B+gwhite -Df -N1 -W -A5000 -K -O --MAP_FRAME_TYPE=plain >> $PS
#gmt psbasemap -$RRsub -$JJsub  -F+p2p,blue -$DD -K -O >> $PS
gmt psbasemap -$RZ -$JJ -$JZ -$pp -B5 -Bz2000+l"topo" -BSEnwZ -K -O >>$PS
gmt grdview $GRD -$JJ -$JZ -$RZ    -Qi500 -N-4000+ggray -C$CPT -$pp -K -O >>$PS

#gmt psscale -Dx5.2i/0.1i+w10c/0.3c -C$CPT -I  -G-4000/8000 -Bx2000 -By+l"m" -K  -O  >>$PS
gmt psxy -$JJ -$RR -T -O >>$PS
gmt psconvert $PS -Tj -A
rm $CPT

