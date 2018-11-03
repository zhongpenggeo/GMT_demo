#!/bin/bash
RR=R105/120/5/25
JJ=JM8c
JJP=JX8C/4.5C
PS=colorbar_ver.ps
CPT=etopo1.cpt
RANGE=-130/335/5
GRD=nanhai_topo.grd
ILLU=tmp.i

gmt gmtset FORMAT_GEO_MAP ddd:mm:ssF

gmt grdgradient $GRD -A45 -Nt -G$ILLU 
gmt psxy -$JJ -$RR -T -K >$PS
gmt grdimage $GRD -$JJ -$RR -B5 -BWSne -I$ILLU -C$CPT -K -O -P >>$PS 
#gmt psscale -$JJ -$RR -DjRB+jLB+o0.5c/0c+w10c/0.3c -C$CPT -I  -G-4000/1000 -Bx1000 -By+l"m" -K -O >>$PS
gmt psscale -Dx8.5c/0.3c+jLB+w10c/0.3c -C$CPT -I  -G-4000/1000 -Bx1000 -By+l"m" -K -O >>$PS
gmt psxy -$JJ -$RR -T -O >>$PS
gmt psconvert $PS -Tj -A -D../GMT_picture/ 
#rm  *.dat *.i gmt.* 
