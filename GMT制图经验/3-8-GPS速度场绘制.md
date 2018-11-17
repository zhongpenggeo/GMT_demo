本文所用到的脚本和数据可以从GitHub上下载下来并运行：[GPS velocity](https://github.com/zhongpenggeo/GMT_demo/tree/master/GPS_velocity)
### GMT绘图原理
GMT绘图是图层叠加模式，即一个图层一个图层地添加，先绘制底图，再叠加其他图层上去。\
相对应的，GMT中有非常多独立的模块，用来绘制一个个图层。\
GMT编程的命令一般是：\
gmt 模块名 -参数+参数值  -参数+参数值 ... >输出文件\
模块相当于一个个独立的小程序。
```sh
gmt grdimage -JM18c -R82/90/42/45 > result.ps
```
上面的例子中，grdimage是模块名，用来把数据变成图形，-J是参数，用来调整图形属性，M18c是参数的值。-R是参数，82/90/42/45是参数值，>表示输出，result.ps是得到的图形，ps是一种图形格式。
### 绘制GPS速度场的准备工作
1. 底图，此次底图为地形图，所以需要地形图的grd文件，本次使用的是etopo1全球地形数据；
2. GPS速度场，分为this study 和Kreemer et al. 2014的结果，需要分为两个TXT文件
### 设计变量，因为有些量经常用到，用变量代替的方式便于后面修改；
变量赋值用： =\
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
### 绘制GPS速度矢量
-J和-R后面不接参数值，表示沿用前面的值。-K -O同时出现表示继续添加图层，注意这里输出符号为<<，不是<，意思是追加。\
psvelo是画速度场的模块；该模块用法详情参见：\
[psvelo](https://modules.gmt-china.org/psvelo/)\
 -Se后面三参数表示：速度值为1的矢量的长度在图上为0.1cm/置信度0.95/台站名大小为0，即不写台站名称；这里为速度为1的矢量\
 -W控制矢量以及误差椭圆的轮廓的宽度为0.2个像素点，颜色蓝色，线型（不设置则默认为实线）\
 -G矢量填充色\
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

## 重要/基础学习资料
一些基础知识都在下面的网站中可以找到，非常实用。\
[GMT中文社区](https://gmt-china.org/)
#### 更多资料
[绘制GPS速度场](https://gmt-china.org/example/ex015/)
[GMT目录](https://www.jianshu.com/p/321f67983c42)
