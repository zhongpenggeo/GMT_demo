#/*************************************************************************
#	> File Name: grid.sh
#	> Author:PengZhong 
#	> Mail: 
#	> Created Time: Sat Nov 17 10:37:37 2018
# ************************************************************************/

#!/bin/bash

PS=map4_r.ps
FI=data4.txt
GRD=grid4_r.grd
CPT=num4_r.cpt
JJ=-JX5c
RR=-R1/3/1/3
gmt gmtset MAP_FRAME_TYPE plain

gmt xyz2grd $FI $RR -I1/1  -r -G$GRD=ef
gmt makecpt -T1/10/1 -Crainbow >$CPT
gmt grdimage $GRD $JJ $RR -C$CPT  -Ba1 -BWSen -K -P  >$PS
gmt psscale -C$CPT $JJ $RR  -DjRB+jLB+w4c/0.3c -B1 -O >>$PS
gmt psconvert -A0.1c -Tj $PS

