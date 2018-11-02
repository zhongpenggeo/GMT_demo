#!/bin/bash
#plot a profile from grd or plane
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

#gmt project -C$START -E$END -G10 -Q >$DAT 
#gmt nearneighbor -I1m -S5m -V $FI -G$GRD -$RR
#gmt grdgradient $GRD -A45 -Nt -G$ILLU 
gmt psxy -$JJ -$RR -T -K >$PS
gmt grdimage $GRD -$JJ -$RR -I$ILLU -C$CPT -K -O -P >>$PS 
gawk '{print $1,$2}' $DAT|gmt psxy -$JJ -$RR -B5 -BWnSe -W2p,red -K -O >>$PS
gmt grdtrack $DAT -G$GRD|gawk '{print $3,$4}' >$PRO_DAT
gmt psscale -$JJ -$RR -DjRB+jLB+o0.5c/0c+w10c/0.3c -C$CPT -I  -G-4000/1000 -Bx1000 -By+l"m" -K -O >>$PS
gmt psscale -DjTL+jLB+w10c/0.3c -C$CPT -I  -G-4000/1000 -Bx1000 -By+l"m" -K -O >>$PS
#求最大小值
X_MAX=`gawk 'END{print $1}' $PRO_DAT`
Y_MIN=`cat $PRO_DAT|gawk 'NR==1{min=$2;next}{min=min<$2?min:$2}END{print min}'`
Y_MAX=`cat $PRO_DAT|gawk 'NR==1{max=$2;next}{max=max>$2?max:$2}END{print max}'`
#Y_RANGE=`gmt grdinfo -T1 $GRD|gawk '{print substr($0,3)}'`
gmt psxy -Y12c $PRO_DAT -$JJP  -R$X_MIN/$X_MAX/$Y_MIN/$Y_MAX -Ba1000 -BSW -W2p --MAP_FRAME_TYPE=graph -K -O >>$PS
gmt psxy -$JJ -$RR -T -O >>$PS
gmt psconvert $PS -Tj -A -D../GMT_picture/
#rm  *.dat *.i gmt.* 
