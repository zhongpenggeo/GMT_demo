#/*************************************************************************
#	> File Name: testtiff.sh
#	> Author:PengZhong 
#	> Mail: 
#	> Created Time: Mon Nov 12 18:27:32 2018
# ************************************************************************/

#!/bin/bash
PS=translate.ps
RR=R-114/-96/38/50
JJ=JM10c
TIFF=map.tiff
gmt gmtset MAP_FRAME_TYPE=fancy
gmt grdimage $TIFF -$JJ -$RR -D -Ba2g2 -BSWen --MAP_GRID_PEN_PRIMARY=0.2p,green >$PS
gmt psconvert $PS -A -Tj
rm gmt.*

