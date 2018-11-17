数据及脚本下载：[github grid](https://github.com/zhongpenggeo/GMT_demo/tree/master/grid)  
### GMT一般绘图流程
- GMT的绘图流程是：  
     1. 网格化，即把三列数据（table数据）配置为grd的格式，方便绘图，这只是一种数据格式的转换（如果用的是xyz2grd，纳闷只是格式转换，如果用的是surface或nearneighbor，则还有插值）；
     2. 绘图并着色。  
- 在这两个过程中分别有两个重要的处理：
    1. 配准：配准就是在网格化的时候，如果把z值对应到（x,y）所确定的网格上去。因为我们的table数据是一个一个点的（x，y确定坐标，z为该坐标点上的值），但是绘出来的图是一个一个像素方块的，在这当中经历了怎样的变化？
2. 着色：怎样把z值和rgb颜色一一对应上？
####本文要讲的就是配准当中的细节。

---
## GMT的配准方式
此处用一个例子来表示,xyz数据为：  
> 1 1 1  
1 2 2  
1 3 3  
2 1 4  
2 2 5   
2 3 6  
3 1 7  
3 2 8  
3 3 9  

#### 1. grid Gridline registration（网格线配准）
在网格线配准的方式下，节点的位置和xyz数据是一样的。  
节点（nodes）处于网格线交叉的位置，它的值是周围cell（Xinc*Yinc）的平均值。如下图所示：  
![gridline registration](https://upload-images.jianshu.io/upload_images/7955445-5c06fdbd83bfb7e0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)  
这种方式得到的grd文件是：  
>  ncols 3  
nrows 3  
xllcenter 1  
yllcenter 1  
cellsize 1  
nodata_value -9999   
3	6	9  
2	5	8  
1	4	7  

绘制出来的图形是：  
![map4.jpg](https://upload-images.jianshu.io/upload_images/7955445-95f628b8866d368c.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)

#### 2.  Pixel registration（像素配准）
像素配准的方式是，节点（nodes）处于cell的中中间，它的值代表每个cell的平均值。所以这里的nodes要比gridline registration的要少一行一列。  
![image.png](https://upload-images.jianshu.io/upload_images/7955445-727942d3bf7469d7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)

得到的grd文件如下：  
> ncols 2  
nrows 2  
xllcorner 1  
yllcorner 1  
cellsize 1  
nodata_value -9999  
4.5	9  
3	7.5  

获得图形：  
![map4_r.jpg](https://upload-images.jianshu.io/upload_images/7955445-c4e096ea6532c311.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)

## GMT中配准方式的应用
#### 1. 默认的配准方式
GMT的默认配准方式是网格线配准，并且绝大部分模块可以同时处理这两种方式。但是部分模块，比如*grdimag*，像素配准可能更好。用*grdsample*和*grdproject*可以切换配准方式；grdedit可以修改文件头请切换两种配准方式。
#### 2. 如何切换配准方式
加入-r。脚本如下：
```sh
#/****************************************************
#	> File Name: grid.sh
#	> Author:PengZhong 
#	> Mail: 
#	> Created Time: Sat Nov 17 10:37:37 2018
# *******************************************************

#!/bin/bash

PS=map4_r.ps
FI=data4.txt
GRD=grid4_r.grd
CPT=num4_r.cpt
JJ=-JX5c
RR=-R1/3/1/3
gmt gmtset MAP_FRAME_TYPE plain
# 注意这里不加+r，则是默认的网格线配准，
#若加了-r，就会变为像素配准。
gmt xyz2grd $FI $RR -I1/1  -r -G$GRD=ef
gmt makecpt -T1/10/1 -Crainbow >$CPT
gmt grdimage $GRD $JJ $RR -C$CPT  -Ba1 -BWSen -K -P  >$PS
gmt psscale -C$CPT $JJ $RR  -DjRB+jLB+w4c/0.3c -B1 -O >>$PS
gmt psconvert -A0.1c -Tj $PS
```
---
#### 更多资料
[GMT目录](https://www.jianshu.com/p/321f67983c42)  
[Windows下安装gmt](https://www.jianshu.com/p/3f1e2d62d73a)    
[GMT绘制GPS速度矢量图](https://www.jianshu.com/p/94792ab8ec97)  
[GMT制图专题](https://www.jianshu.com/c/1cc3a57914f9)

