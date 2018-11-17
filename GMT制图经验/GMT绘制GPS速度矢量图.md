绘图脚本及数据下载：[GPS_velocity](https://github.com/zhongpenggeo/GMT_demo/tree/master/GPS_velocity)

### GMT绘图原理
GMT绘图是图层叠加模式，即一个图层一个图层地添加，先绘制底图，再叠加其他图层上去。
相对应的，GMT中有非常多独立的模块，用来绘制一个个图层。
GMT编程的命令一般是：
gmt 模块名 -参数+参数值  -参数+参数值 ... >输出文件
模块相当于一个个独立的小程序。
```sh
gmt grdimage -JM18c -R82/90/42/45 > result.ps
```
上面的例子中，grdimage是模块名，用来把数据变成图形，-J是参数，用来调整图形属性，M18c是参数的值。-R是参数，82/90/42/45是参数值，>表示输出，result.ps是得到的图形，ps是一种图形格式。
### 绘制GPS速度场的准备工作
1. 底图，此次底图为地形图，所以需要地形图的grd文件，本次使用的是etopo1全球地形数据；
2. GPS速度场，分为this study 和Kreemer et al. 2014的结果，需要分为两个TXT文件
### 设计变量，因为有些量经常用到，用变量代替的方式便于后面修改；
变量赋值用： =
调用变量用： \$变量名，即\$PS表示Li.ps
``` sh
PS=Li.ps  #图名
#R代表经纬度范围，经度82-90度，纬度42-45度
RR=R82/90/42/45 
#J代表投影方式，即把球形投影到平面上的方式；
#M为墨卡托投影，18c表示全图长18cm，宽根据长宽比自动调整。
JJ=JM18c
#这是色彩文件，用来把地形数据映射为颜色，
#如多少米用哪种颜色表示，GMT自带了一些常用的cpt文件。
CPT=etopo1.cpt
GRD=Li_topo.grd#grd为网格数据，这里是地形数据
ILLU=topo.i#梯度数据，后面会讲到
TXT1=GPS_this.txt
TXT2=GPS_K.txt#两个GPS速度场
```
### 先绘制地形图
```sh
 #求梯度，调用grdgradient模块，让地形图有立体感，
#或者理解为在某一个方向加光照效果，—G表示生成的梯度文件。
# 这里，输入文件是Li_topo.grd，即$GRD变量，-A表示光照的方向为135度，
#-G表示输出文件（-G也是一种表示输入输出文件的方式）
gmt grdgradient $GRD -A135 -Nt -G$ILLU
#画地形图
#这里终于开始画图了。
#-I表示光照文件，-B定义轴属性，a为坐标轴显示的间隔，
#2表示2度一个刻度，NWse分别是北西南东，大写表示那个方向的轴会画出来，
#-K表示开始画图，-V是输出错误信息，-P，因为GMT默认输出画布大小为A4规格，P表示旋转，把画布横着放。
gmt grdimage $GRD -$RR -I$ILLU  -Ba2 -BNWse -$JJ -C$CPT  -K -V -P >$PS
```
结果

![加梯度](https://upload-images.jianshu.io/upload_images/7955445-9ce0bb4e4a408b7a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)

如果不加入梯度

![image.png](https://upload-images.jianshu.io/upload_images/7955445-018ec4f5abf3cfb6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)

## 或者选择geotiff图片作为底图
参见：[geotiff作为GMT的底图](https://www.jianshu.com/p/6fb09872af35)

## 绘制GPS速度矢量
-J和-R后面不接参数值，表示沿用前面的值。-K -O同时出现表示继续添加图层，注意这里输出符号为<<，不是<，意思是追加。
psvelo是画速度场的模块；该模块用法详情参见：[psvelo](https://modules.gmt-china.org/psvelo/)
 -Se后面三参数表示：速度值为1的矢量的长度在图上为0.1cm/置信度0.95，https://modules.gmt-china.org/psvelo//台站名大小为0，即不写台站名称；这里为速度为1的矢量
 -W控制矢量以及误差椭圆的轮廓的宽度为0.2个像素点，颜色蓝色，线型（不设置则默认为实线）
 -G矢量填充色
 -A控制矢量的属性，0.15c是矢量头的大小，+e表示在矢量尾端绘制箭头，+p0.75p矢量线段部分的宽度
```sh
gmt psvelo $TXT1 -J -R -Se0.1c/0.95/0 -A0.15c+e+p0.75p -Gblue -W0.2p,blue -K -O >> $PS
gmt psvelo $TXT2 -J -R -Se0.1c/0.95/0 -A0.15c+e+p0.75p -Gblue -W0.2p,blue -K -O >> $PS
```
![image.png](https://upload-images.jianshu.io/upload_images/7955445-0d974b21091a82f3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)

### 绘制地形图的色标
-D表示色标在图上的位置，-B定义刻度，x表示x轴方向，a2000表示坐标轴隔2000显示一个数值，f400表示隔400一个刻度，+l表示加色标名称，-O表示绘图文件\$PS关闭
```sh
gmt psscale -DjCB+w18c/0.3c+o0/-2.5c+h -R -J -C$CPT  -Bxa2000f400+l"Elevation/m"  -O >> $PS
```
### 把PS格式的图片转换为通用格式
-T定义输出格式，t表示tif（还有j表示jpg，f表示pdf），-E定义分辨率，600dpi，-A表示去掉留白部分，因为GMT默认的画纸大小为A4
```sh
gmt psconvert $PS -Tt -E600 -A
```
![image.png](https://upload-images.jianshu.io/upload_images/7955445-4593ea0991a510ed.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)

#### 附：完整shell脚本
执行顺序：先执行地形代码，生成地形地图，然后再执行代码2绘制GPS速度，分成两个代码是地形图基本可以一次绘制成功，同时绘制比较费时，而GPS速度可能需要多次修改，分成两个脚本以后，修改GPS速度绘制脚本是就不需要再重新绘制地形图了，可以直接用上一个生成的地形图。
1. 绘制地形的代码
```sh
# 给变量命名，后面使用变量时为$变量名，如$PS.
PS=topography.ps
RR=R82/90/42/45
JJ=JM18c
#RRsub=R60/140/4/60
#DD=D70/110/15/45
#JJsub=JM1.5i
#PS=topo.ps
CPT=etopo1.cpt
GRD=Li_topo.grd
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
gmt grdimage $GRD -$RR -I$ILLU  -Ba2 -BNWse -$JJ -C$CPT  -K -V -P >$PS
gmt psscale -DjCB+w18c/0.3c+o0/-2.5c+h -R -J -C$CPT  -Bxa2000f400+l"Elevation/m" -K -O >> $PS
```
2. 绘制GPS速度场的代码
```sh
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
RR=R82/90/42/45
JJ=JM18c
#RRsub=R60/140/4/60
#DD=D70/110/15/45
#JJsub=JM1.5i
#PS=topo.ps
CPT=etopo1.cpt
GRD=Li_topo.grd
#RANGE=-550/380/20
ILLU=topo.i
TXT1=GPS_this.txt
TXT2=GPS_K.txt

# 把地形图拷贝一份并换个名字，之后直接向地形图里加入矢量，
# 同时原来的地形图有保存下来了，可以继续使用
cp $PS0 $PS
# 设置经纬度显示格式
gmt gmtset FORMAT_GEO_MAP ddd:mm:ssF

# 这行命令不能动。
# 这里只是为了使用-K选项，方便修改，psxy配合-T表示什么也不做，
#gmt psxy $JJ $RR -T -K >> $PS
# 绘制速度矢量场
gmt psvelo $TXT1 -$JJ -$RR -Se0.1c/0.95/0 -A0.25c+e+p1p\
 -Gblue -W0.5p,blue -V -K -O >> $PS

gmt psvelo $TXT2 -$JJ -$RR -Se0.1c/0.95/0 -A0.25c+e+p1p \
-Gred -W0.5p,red -V -K -O >> $PS
 ps scale
 
 # 绘制图例的白色背景，四行数字分别是背景框的左上、右上、右下、左下四个点的经纬度
gmt psxy -$JJ -$RR -Gwhite -K -O >> $PS << EOF
88.5 42.6
90 42.6
90 42
88.5 42
EOF

#加入文字，数字分别表示东经89，北纬42.5，即文字在图中的位置，10\2611 表示10正负1
gmt pstext -J -R -F+f7p+jML -K -O >> $PS << EOF
89 42.5 10\2611 mm/yr
EOF

# 在绘制矢量箭头的图例，思路是假定在图例背景框里有一个速度矢量，所以需要自己造一行GPS速度的数据，
# 这样可以在特定位置绘制一个速度箭头，所以下面一行的数字即是GPS速度的数据格式。
gmt psvelo -J -R -Se0.1c/0.95/0 -A0.25c+e+p1p -Gblue -W0.5p,blue -K -O >> $PS << EOF
88.5 42.3 10 0 1 1 0
EOF

# 加入文字，这里需要微调文字的位置，前两个数字是文字的位置，后面0.25 2c c分别表示
# 行间距0.25，段落宽度2cm，c事central，即居中对齐。
gmt pstext -J -R -F+f6p+jML -M -K -O >> $PS << EOF
> 89 42.3 
This Study
EOF
gmt psvelo -J -R -Se0.1c/0.95/0 -A0.25c+e+p1p -Gred -W0.5p,red -K -O >> $PS << EOF
88.5 42.1 10 0 1 1 0
EOF
gmt pstext -J -R -F+f6p+jML -M  -K -O >> $PS << EOF
> 89.13 42.1 0.25 2c c
Kreemer et al. 2014
EOF

# 这行不能动这句话表示画图结束，只是为了使用-O选项
gmt psxy $JJ $RR -T -O >> $PS
#图片格式转换
gmt psconvert $PS -Tt -E600 -A
```
---
更新：
2018-11-5： 增加绘图所需脚本和数据的github下载地址


---
## 重要/基础学习资料  
一些基础知识都在下面的网站中可以找到，非常实用。  
[GMT中文社区](https://gmt-china.org/)    
**更多资料**  
[GMT目录](https://www.jianshu.com/p/321f67983c42)  
[geotiff作为GMT的底图](https://www.jianshu.com/p/6fb09872af35)
