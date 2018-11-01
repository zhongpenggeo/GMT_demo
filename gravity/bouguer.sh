RR=R105/120/5/25
JJ=JM4i
PS=bouguer.ps
CPT=bouguer.cpt
FI=nanhai_bouguer_gravity.txt
RANGE=-130/335/5
GRD=bouguer.grd
#gmt gmtset FORMAT_GEO_MAP ddd:mm:ssF
gmt pscoast -$RR -$JJ -Sc -K -V -P -Y1.5i >$PS
gmt nearneighbor -I2m -S5m -V $FI -G$GRD -$RR
gmt grd2cpt $GRD -Chaxby -Z -V > $CPT
gmt grdgradient $GRD -A45 -Nt -Gtmp.i
gmt grdimage $GRD -R -Itmp.i -J -C$CPT  -K -V -O >>$PS
gmt grdcontour $GRD -J -C20  -S4 -B1a2 -W0.25p,gray30  -V -O -K >>$PS
gmt pscoast -$RR -$JJ -Q -K -O -V >>$PS
gmt pscoast -$RR -$JJ -Ba5f1g5 -BNWse -N1/0.5p,black -W1/1p,black -O -K >>$PS
gmt psscale -Dx0.1i/-0.3i+w8.5c/0.5c+h -C$CPT -I -Bx100 -By+l"mGal" -O >>$PS
gmt psconvert $PS -Tj -A
rm $CPT 

