#!/bin/bash
RR=R105/120/5/25
JJ=JM8c
JJP=JX8C/4.5C
PS=profile.ps
CPT=etopo1.cpt
FI=nanhai_topography.txt
RANGE=-130/335/5
GRD=topo.grd
PRO_DAT=track_profile.dat
START=106/24
END=119/6
X_MIN=0
ILLU=tmp.i
DAT=trac.dat

gmt grdgradient $GRD -A45 -Nt -G$ILLU 
gmt grdimage $GRD -$JJ -$RR -I$ILLU -C$CPT -K -O -P >>$PS 
gmt psscale -$JJ -$RR -DjRB+jLB+o0.5c/0c+w10c/0.3c -C$CPT -I  -G-4000/1000 -Bx1000 -By+l"m" -K -O >>$PS
#gmt psscale -DjTL+jLB+w10c/0.3c -C$CPT -I  -G-4000/1000 -Bx1000 -By+l"m" -K -O >>$PS
gmt psconvert $PS -Tj -A -D../GMT_picture/ 
#rm  *.dat *.i gmt.* 
