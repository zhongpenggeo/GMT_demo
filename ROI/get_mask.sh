#/*************************************************************************
#	> File Name: get_mask.sh
#	> Author:PengZhong 
#	> Mail: 
#	> Created Time: Wed Nov 28 15:19:46 2018
# ************************************************************************/

#!/bin/bash
GRD=out.grd
OUTGRD=poly.grd
FI=out.txt
RR=`gmt gmtinfo $FI -I-`
gmt grdmask $FI $RR -NNaN/1/1 -I0.02d/0.02d -S0k -G$OUTGRD=nb -V
gmt grdmath $GRD $OUTGRD MUL = out_mask.grd 
