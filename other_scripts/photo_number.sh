#!/bin/bash

cd ../Sony
INFO_FILE=../sh/photo_information.txt
DATE_FILE=../sh/num_time.txt
# get initial time of photo files
ls -lR --full-time|grep -E "ARW|JPG|jpg"|awk '{print $6}'|sed  '/^$/d'  > $INFO_FILE
# get number of same date of file
sort $INFO_FILE | uniq -c > $DATE_FILE
## gmt plot 
f=photo_num
PS=../sh/$f.ps
PDF=../sh/$f.pdf
PNG=../sh/$f.png
# time range
tStart=`gawk '{system("date +%s -d"$2)}' $DATE_FILE | sort | head -n 1`
TIME_BEGAIN=`date +%Y-%m-%d -d "1970-01-01 UTC $tStart seconds"`
tStart=$[$tStart-172800]
tStart=`date +%Y-%m-%dT%H:%M:%S -d "1970-01-01 UTC $tStart seconds"`
tEnd=`gawk '{system("date +%s -d"$2)}' $DATE_FILE | sort | tail -n 1`
TIME_END=`date +%Y-%m-%d -d "1970-01-01 UTC $tEnd seconds"`
tEnd=$[$tEnd+172800]
tEnd=`date +%Y-%m-%dT%H:%M:%S -d "1970-01-01 UTC $tEnd seconds"`
# number range
MAX_NUM=`gawk '{print $1}' $DATE_FILE|gawk 'NR==1{max=$1;next}{max=max>$1?max:$1}END{print max}'`

gmt gmtset FORMAT_DATE_MAP=o
gmt gmtset FORMAT_DATE_IN=yyyy-mm-dd 
gmt gmtset FONT=18p,1,black
gmt gmtset FONT_ANNOT_PRIMARY=+18p,1,black
gmt gmtset FONT_LABEL=20p,1,black
#gmt set FONT_ANNOT=18p,1,black
#gmt set FONT_TITLE=18p,1,black
gmt set MAP_TITLE_OFFSET=4p
gmt set MAP_FRAME_WIDTH=0.5p

nSites=`cat $DATE_FILE | wc -l`
TOTAL_PHOTO=`gawk 'BEGIN{total=0}{total+=$1}END{print total}' $DATE_FILE`
barWidth=0.92 # the offset of bars is 1-$barWidth.
barColor=darkcyan
fac=0.5
pBarWidth=`echo $fac*$barWidth | bc`
JJ=JX25c/15c
RR=R${tStart}T/${tEnd}T/0/$[$MAX_NUM+30]
FF=f18p,1,black

gmt psxy -$JJ -$RR -T -K  > $PS
gmt psbasemap -$JJ -$RR -Y1c -Bwsne -Bpxa4of1o -Bya100 --MAP_TICK_LENGTH=0p -K -O >> $PS
gawk '{print $2,$1}' $DATE_FILE | gmt psxy -$JJ -$RR -Bsxa1Yg1Y+l"date" -Bpxa4Of1o -Bya100+l"number of photos" -BSW -Sc0.003c -W${pBarWidth}c,$barColor   -K -O >> $PS
echo "from $TIME_BEGAIN to $TIME_END"|gmt pstext  -$RR -$JJ -F+cRT+$FF -D-0.5c/-0.5c -K -O >> $PS
echo "Time spent: $nSites days;" |gmt pstext  -$RR -$JJ -F+cRT+$FF -D-0.5c/-1.5c -K -O >> $PS
echo "Total number of photos: $TOTAL_PHOTO" |gmt pstext  -$RR -$JJ -F+cRT+$FF -D-0.5c/-2.5c -K -O >> $PS
gmt psxy -$JJ -$RR -T -O >> $PS
#
#  export PDF, PNG.
#
gmt psconvert $PS -Tf -A -F$PDF
gmt psconvert $PS -Tg -A -F$PNG
rm gmt.*