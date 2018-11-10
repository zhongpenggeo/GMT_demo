#!/bin/bash
gmt begin 
RR=R70/110/15/45
RZ=R70/110/15/45/-4000/5000
JJ=JM10c
JZ=JZ4c
CPT=etopo1
GRD=Tibet_topo.grd
#pp=p0/40
PP=p$[ $MOVIE_FRAME*5 ]/40
gmt set MAP_FRAME_TYPE=fancy

gmt basemap -$RZ -$JJ -$JZ -$PP -B5 -Bz2000+l"topo" -BSEnwZ 
gmt grdview $GRD -$JJ -$JZ -$RZ    -Qi500 -N-4000+ggray -C$CPT -$PP 

#gmt psscale -Dx5.2i/0.1i+w10c/0.3c -C$CPT -I  -G-4000/8000 -Bx2000 -By+l"m" -K  -O  >>$PS
gmt end
