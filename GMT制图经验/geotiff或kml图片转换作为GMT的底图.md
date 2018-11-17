需要的软件：GMT，gdal_translate(安装方式参见：[在GMT中使用SRTM3高精度地形](https://www.jianshu.com/p/5440b756cf74)）  
主要命令：grdimage，gdal_translate

#### 基本原理
1. 由于grdimage不仅可以使用单个grd数据作为输入，同时还可以输入r，g，b三个波段的geotiff格式的数据，如果安装了gdal，还可以用geotiff图片作为底图。
2. geotiff图件可以转换为grd，因为两者都是带坐标信息的。
3. 

## 流程
#### 第一步：kml to geotiff
1. 先导出kmz(或者kml，但推荐前者)  
2. 用在线网站把kmz转为geotiff：[convert kml to geotiff](https://mygeodata.cloud/converter/kml-to-geotiff)  
#### 第二步： geotiff作为底图
得到geotiff之后有两种方法，  
1. 把geotiff转为grd。**注意**，转出来之后z值是0-1.可以用gmtinfo查看具体信息。  
2. 用grdimage画图，由于z值是0-1，推荐用gray色标。
- 方法二：
**更简单的方式：grdimag -D就可以实现带坐标图片作为底图**  
-D表示会自动调用gdal来读取图片，所以确保自己安装了gdal_translate；  
-Dr表示强制规定图片的经纬度范围是-R所设置的
脚本：
```

#!/bin/bash
PS=translate.ps
RR=R-114/-96/38/50
JJ=JM10c
TIFF=map.tiff
gmt gmtset MAP_FRAME_TYPE=fancy
gmt grdimage $TIFF -$JJ -$RR -D -Ba2g2 -BSWen --MAP_GRID_PEN_PRIMARY=0.2p,green >$PS
gmt psconvert $PS -A -Tj
rm gmt.*
```
- map.tiff

![map.tiff](https://upload-images.jianshu.io/upload_images/7955445-177aadac875de437.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- 转换裁剪后的图片：

![translate.jpg](https://upload-images.jianshu.io/upload_images/7955445-8ebcf066d62dc2bb.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/540)

### Bug
如果你的图片不是WGS84坐标（比如说做了墨卡托投影），那么gdal无法读取图片中的经纬度（因为它不是经纬度格式）。  
如何确保你的tiff图片是WGS84坐标系统且没有做投影：  
> gdalinfo input.tiff

![image.png](https://upload-images.jianshu.io/upload_images/7955445-4d5ee0bcea7204a4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

这种说明是正常的没有做投影的；

![image.png](https://upload-images.jianshu.io/upload_images/7955445-969dc08bd8de4007.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
这种是做过墨卡托投影的，无法直接作为gmt的输入图片。切记！


---
参考资料：  
[GMT绘图geotiff转grd](https://blog.csdn.net/wanion911/article/details/48209555)

---

#### 更多资料
[GMT目录](https://www.jianshu.com/p/321f67983c42)  
[Windows下安装gmt](https://www.jianshu.com/p/3f1e2d62d73a)   
[GMT绘制GPS速度矢量图](https://www.jianshu.com/p/94792ab8ec97)  
[GMT制图专题](https://www.jianshu.com/c/1cc3a57914f9)

---
2018-11-11：第二次更新，跑成功了kml到geotiff，再到grd的完整流程
