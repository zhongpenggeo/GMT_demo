#!/bin/bash

# 给变量命名，后面使用变量时为$变量名，如$PS.
PS=topography.ps
RR=R55/145/5/60
JJ=JM18c
#RRsub=R60/140/4/60
#DD=D70/110/15/45
#JJsub=JM1.5i
#PS=topo.ps
CPT=etopo1.cpt
GRD=China_topo.grd
#RANGE=-550/380/20
ILLU=topo.i
TXT=GPS.txt

#设置轴，即四条边的形态，是铁轨型，还是线条型
gmt gmtset MAP_FRAME_TYPE plain
#设置经纬度显示格式，F表示后面加上WESN
gmt gmtset FORMAT_GEO_MAP ddd:mm:ssF
#求梯度，让地形图有立体感，或者理解为在某一个方向加光照
gmt grdgradient $GRD -A135 -Nt -G$ILLU
#画地形图
gmt grdimage $GRD -$RR -I$ILLU   -BNWse -$JJ -C$CPT  -K -V -P >$PS
gmt psscale -DjCB+w18c/0.3c+o0/-2.5c+h -R -J -C$CPT  -Bxa2000f400+l"Elevation/m" -K -O >> $PS
