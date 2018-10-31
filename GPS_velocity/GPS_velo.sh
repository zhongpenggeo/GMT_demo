#!/bin/bash

# 这个程序用来在地形图的基础上绘制GPS速度矢量
# 之所以分为两个程序，是因为地形图不需要调整，而速度矢量需要调整
# 所以地形图程序只需要执行一次，而这个脚本由于矢量大小、图例的位置等都需要调整，
# 需要多次运行。
# 同时，地形图由于数据较大，绘图费时间，分为两个程序可以减少重复绘制地形图所浪费的时间

# 本程序主要有两步，绘制速度矢量，绘制相应图例。

#变量命名
PS0=topography.ps #地形图名字
PS=gps_velocity.ps #速度矢量图名字
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
TXT1=GPS_this.txt
TXT2=GPS_K.txt

# 把地形图拷贝一份并换个名字，之后直接向地形图里加入矢量，
# 同时原来的地形图有保存下来了，可以继续使用
cp $PS0 $PS
# 设置经纬度显示格式
gmt gmtset FORMAT_GEO_MAP ddd:mm:ssF

# 绘制速度矢量场
gmt psvelo $TXT1 -$JJ -$RR -Se0.1c/0.95/0 -A0.25c+e+p1p\
 -Gblue -W0.5p,blue -B10 -BWNse -V -K -O >> $PS

gmt psvelo $TXT2 -$JJ -$RR -Se0.1c/0.95/0 -A0.25c+e+p1p \
-Gred -W0.5p,red -V -K -O >> $PS
 
# # 绘制图例的白色背景，四行数字分别是背景框的左上、右上、右下、左下四个点的经纬度
#gmt psxy -$JJ -$RR -Gwhite -K -O >> $PS << EOF
#88.5 42.6
#90 42.6
#90 42
#88.5 42
#EOF
#
##加入文字，数字分别表示东经89，北纬42.5，即文字在图中的位置，10\2611 表示10正负1
#gmt pstext -J -R -F+f7p+jML -K -O >> $PS << EOF
#89 42.5 10\2611 mm/yr
#EOF
#
## 在绘制矢量箭头的图例，思路是假定在图例背景框里有一个速度矢量，所以需要自己造一行GPS速度的数据，
## 这样可以在特定位置绘制一个速度箭头，所以下面一行的数字即是GPS速度的数据格式。
#gmt psvelo -J -R -Se0.1c/0.95/0 -A0.25c+e+p1p -Gblue -W0.5p,blue -K -O >> $PS << EOF
#88.5 42.3 10 0 1 1 0
#EOF
#
## 加入文字，这里需要微调文字的位置，前两个数字是文字的位置，后面0.25 2c c分别表示
## 行间距0.25，段落宽度2cm，c事central，即居中对齐。
#gmt pstext -J -R -F+f6p+jML -M -K -O >> $PS << EOF
#> 89 42.3 
#This Study
#EOF
#gmt psvelo -J -R -Se0.1c/0.95/0 -A0.25c+e+p1p -Gred -W0.5p,red -K -O >> $PS << EOF
#88.5 42.1 10 0 1 1 0
#EOF
#gmt pstext -J -R -F+f6p+jML -M -K -O >> $PS << EOF
#> 89.13 42.1 0.25 2c c
#Kreemer et al. 2014
#EOF
#
gmt psxy -J -R -T -O >>$PS
##图片格式转换
gmt psconvert $PS -Tj -E600 -A
