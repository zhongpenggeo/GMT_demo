ETOPO1是包含全球（陆地、海洋与两极）的数字地形数据，分辨率为1弧分，基本可以满足大范围的地球科学绘图需要。本文主要讲述ETOPO1数据的下载与成图  
关于地形图的介绍参见：[0-1 在GMT中使用高精度地形图SRTM3](https://www.jianshu.com/p/5440b756cf74)


1. 工具：wget

- linux或win10子系统下：wget是默认已经安装的。若未安装，在Ubuntu下可输入：

> sudo apt install wget

即可安装

- windows下：[Windows下安装wget](https://blog.csdn.net/guowenyan001/article/details/50172765)
2. 下载ETOPO1
附上shell脚本，如何使用shell脚本参见：[Windows下直接执行shell脚本](https://www.jianshu.com/p/d8c3dedf8b8f)：：
```sh
#########################################################################
# File Name: down_etopo1.sh
# Author: pengzhong
# mail: ***@163.com
# Created Time: Sun 25 Sep 2016 10:42:00 PM CST
#########################################################################
#!/bin/bash

wget -c http://www.ngdc.noaa.gov/mgg/global/relief/ETOPO1/data/ice_surface/grid_registered/xyz/ETOPO1_Ice_g_int.xyz.gz
```
解压并命名为ETOPO1.xyz
3. 用GMT绘图
附上shell脚本：
```
#!/bin/bash
RR=R70/110/15/45
JJ=JM5i
RRsub=R60/140/4/60
DD=D70/110/15/45
JJsub=JM1.5i
PS=topo.ps
CPT=etopo1.cpt
FI=ETOPO1.xyz
GRD=Tibet_topo.grd
RANGE=-550/380/20
ILLU=topo.i


gmt xyz2grd -I1m/1m  -V $FI -G$GRD -$RR
gmt grdgradient $GRD -A135 -Nt -G$ILLU
gmt grdimage $GRD -$RR -I$ILLU -Ba10f5g10 -BNWse -$JJ -C$CPT  -K -V -P >$PS
#gmt grdcontour $GRD -$JJ -C100  -S4  -W0.25p,gray20  -V -K  -O >>$PS
#gmt pscoast -$RR -$JJ -Ba10f5g5 -BNWse -N1/0.5p,black -W1/0.5p,black -K -O >>$PS
# insert map
gmt pscoast -$RRsub -$JJsub -B0 -B+gwhite -Df -N1 -W -A5000 -K -O --MAP_FRAME_TYPE=plain >> $PS
gmt psbasemap -$RRsub -$JJsub  -F+p2p,blue -$DD -K -O >> $PS

gmt psscale -Dx5.2i/0.1i+w10c/0.3c -C$CPT -I  -G-4000/8000 -Bx2000 -By+l"m" -O >>$PS
gmt psconvert $PS -Tj -A
rm $CPT

```

结果：

![西藏地区图中图](https://upload-images.jianshu.io/upload_images/7955445-0185f8650a4a521f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

---
#### 更多资料  
[GMT目录](https://www.jianshu.com/p/321f67983c42)  
[Windows下安装gmt](https://www.jianshu.com/p/3f1e2d62d73a)   
[GMT绘制GPS速度矢量图](https://www.jianshu.com/p/94792ab8ec97)  
[GMT制图专题](https://www.jianshu.com/c/1cc3a57914f9)
