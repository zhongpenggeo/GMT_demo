RR=R70/110/15/45
JJ=JX5i
RRsub=R60/140/4/60
DD=D70/110/15/45
JJsub=JM1.5i
PS=topo_ps.ps
CPT=etopo1.cpt
GRD=Tibet_topo.grd
RANGE=-550/380/20
ILLU=topo.i

gmt set MAP_FRAME_TYPE=inside
#gmt grdgradient $GRD -A135 -Nt -G$ILLU
gmt grdimage $GRD -$RR -Ba10f5g10 -BNWse -$JJ -C$CPT  -K -V -P >$PS
#gmt grdcontour $GRD -$JJ -C100  -S4  -W0.25p,gray20  -V -K  -O >>$PS
#gmt pscoast -$RR -$JJ -Ba10f5g5 -BNWse -N1/0.5p,black -W1/0.5p,black -K -O >>$PS
# insert map
#gmt pscoast -$RRsub -$JJsub -B0 -B+gwhite -Df -N1 -W -A5000 -K -O --MAP_FRAME_TYPE=plain >> $PS
#gmt psbasemap -$RRsub -$JJsub  -F+p2p,blue -$DD -K -O >> $PS

#gmt psscale -Dx5.2i/0.1i+w10c/0.3c -C$CPT -I  -G-4000/8000 -Bx2000 -By+l"m" -O >>$PS
gmt psxy -$JJ -$RR -T -O >>$PS
#gmt psconvert $PS -Tj -A
