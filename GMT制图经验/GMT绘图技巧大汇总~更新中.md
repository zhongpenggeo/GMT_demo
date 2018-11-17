整个系列是关于自己学习和使用GMT过程中的一些心得，比较简陋，写的很随意。  
关于GMT软件的介绍,参见[GMT简介](https://www.jianshu.com/p/b6c0c8efbb90)；  
GMT教程教程可以访问[GMT中文社区](http://gmt-china.org/);  
里面有具神(别号：seisman，可以在网上搜索他的博客，技术非常强的一位中科大的博士);  
本系列算是进阶版本的资料吧，主要是一些经验之谈。\
**适用对象**：非天然地震专业的其他学生（因为不会画震源机制解）。\
**版本**：5.4.2
本系列所有的代码和数据可以从GitHub下载：[GMT演示实例](https://github.com/zhongpenggeo/GMT_demo)  


---
新版本来了，现在开始记录**[GMT6.0的学习笔记](https://www.jianshu.com/p/ac52b407efa1)**

## 目录
**[GMT简介](https://www.jianshu.com/p/b6c0c8efbb90)**  
**[GMT快速入门](https://www.jianshu.com/p/55c7158b30b7)**  
**[在windows下安装GMT](https://www.jianshu.com/p/3f1e2d62d73a)**  
**[Windows下使用GMT的吐槽](https://www.jianshu.com/p/39f04fa602d9)**  
**[吐槽帖--GMT网格化对非经纬度坐标的不支持](https://www.jianshu.com/p/372d82a8610f)**
**[用gdal转换geotiff作为GMT底图](https://www.jianshu.com/p/e3e0e50af8b5)**
**[GMT网格配准的方式](https://www.jianshu.com/p/da5b90270974)**

1. 参数设置：修改一些画图中的默认参数。\
    - [修改参数的方法有三种](https://www.jianshu.com/p/b81f325ea0e8)：
        1. 直接在命令里加入： --参数名=值，如 --MAP_FRAME_TYPE=plain
        2. 在命令的开头声明： gmt gmtset MAP_FRAME_TYPE=plain 
        3.  把之前画图产生的gmt.conf 复制到当前目录
    - [时间轴的设置](https://www.jianshu.com/p/26fb9bbf27ba)，[颠倒轴的顺序方向](https://www.jianshu.com/p/00cc0ae95b96)
    - [图的框架](https://www.jianshu.com/p/cb889edd35cc)
    - [经纬度的显示格式](https://www.jianshu.com/p/386890c8e1ae)
    - [网格线设置](https://www.jianshu.com/p/6f9688c58905)
    - [H选项去除头几行](https://www.jianshu.com/p/826134a73f29)
- 
2. 模块：
    - 重点介绍
        - **[色标的选择](https://www.jianshu.com/p/fdef570ba022)**
        - [数据的网格化-grd文件的生成](https://www.jianshu.com/p/8dee144230a5)，
        这两个是基础，也是**重中之重**；
        - 还有[grdgradient](https://www.jianshu.com/p/bad77e39b47b)，梯度绝对为图件添色不少，使二维图出现立体效果，尤其是地形、重力等数据非常好看。
        - [psconvert把ps文件转换为KML与Geotiff](https://www.jianshu.com/p/913b52b99001)：GMT既可以输出jpg等普通图件，也可以输出KML和Geotiff这些图件供Google Earth 和GIS软件使用。
    - [地理坐标棒图](https://www.jianshu.com/p/8069ce905031)
    - [调整色标位置](https://www.jianshu.com/p/30881b812cc5)
    - [grdcontour等值线](https://www.jianshu.com/p/0da2c8b8117c)
    - [grd文件裁剪和拼接](https://www.jianshu.com/p/0f6867da256c)
    - [grd文件格式转换](https://www.jianshu.com/p/eaba2f727621)
    - [gmtinfo与grdinfo](https://www.jianshu.com/p/2dae33e3a836)
    

3. 实例:
目前收录了：
    - [多张图的排布](https://www.jianshu.com/p/d0db5c04f292)，如同时画四张图，如何排版
    - [如何画地震波形](https://www.jianshu.com/p/dcc6f0b1d66b)，把多个地震波形放在一张图上（有点鸡肋）
    - [海洋区的重力异常](https://www.jianshu.com/p/83ae2f3fbb7c)：可以去掉陆地，同时又使用了梯度，色标的选择也很好
    - [用GMT绘制精美地形图](https://www.jianshu.com/p/97b2a202baa8)
    - [图中图](https://www.jianshu.com/p/0fafdeb57d42)：主要信息图件（如重力）和一个区域位置图
    - [三维图](https://www.jianshu.com/p/51693e977e3c)
    - [从grd 中提取剖面](https://www.jianshu.com/p/ad9ae6ef93b1)：如从重力二维平面图中提取一条直线的剖面重力。GMT提供了多种选择剖面的方式，如沿大圆路径等
    - [grd文件的加减乘除](https://www.jianshu.com/p/63e6775e43cc)：在将多个grd文件相加时会用到。
    - [GPS速度矢量场的绘制](https://www.jianshu.com/p/94792ab8ec97)：把GPS速度绘制到地形图上。
    - MT曲线：[1]是自己据杨老师的草稿修改而来，[2]是杨老师的终稿。
    - [甘特图](https://www.jianshu.com/p/5e18c5ba1d0f)。
    - [GMT三维切片图](https://www.jianshu.com/p/2f1823081c51)，引自简书[九天学者](https://www.jianshu.com/u/b0523c9a1f6d)，博客里有很多工具和编程软件的使用小结。
    - GMT中文社区有很多GMT范例，[GMT示例](https://gmt-china.org/example/)
    - 以及一些经典的GMT图件制作方法，[GMT图库](https://gmt-china.org/example/)
4. 地形图数据的下载与使用：
    - [在GMT中使用全球地形数据ETOPO1](https://www.jianshu.com/p/7c59c7129aab)
    - [在GMT中使用SRTM3高精度地形数据](https://www.jianshu.com/p/5440b756cf74)
5. shell编程小技巧\
一些有意思的trick，主要是shell中一些常用小工具的技巧。\
收录有：
    - [提取文件名/去除文件后缀](https://www.jianshu.com/p/6c30f04a66bb)
    - [Windows下直接执行/编写shell脚本](https://www.jianshu.com/p/d8c3dedf8b8f)
    - [如何搜索多列中的最大值和最小值](https://www.jianshu.com/p/72aee565dab8)，使用了gawk和gmtinfo。
    - sed引用外部变量
    - gawk引用外部变量
    - cut提取字节，主要用于对时间轴的格式处理
6. [数据下载](https://gmt-china.org/datas/)
GMT中文社区总结了各种地形图、以及中国政治国界、省界、河流、断层等数据的下载。（非常好，之前我就一直向做一个数据下载的汇总，因为每次下载数据总要搜索半天，或者不知道有这些公开的数据。very good！）


## 参考资料
包括：
- [GMT中文社区](http://gmt-china.org/)翻译的中文帮助文档
- [GMT官网英文帮助文档](http://gmt.soest.hawaii.edu/projects/gmt/wiki/Documentation)
- [台湾大学胡植庆老师的个人网站](http://140.112.56.1/geodesy1/index.php?option=com_content&task=category&sectionid=9&id=23&Itemid=49)
- [Yi Shuang的《GMT之路2.0》](https://pan.baidu.com/s/1lFDH0GZrjlidItcW6SMo7g)\
密码：b2gw
- 其他（注意：GMT中文社区已经汇总了，下载地址为：[中国各种边界数据+全球各种精度地形数据](https://gmt-china.org/datas/)
## 个人收集的一些GMT绘图需要的txt文件资料
- 国界线（国家发布的标准国界），注意GMT定义的中国国界与真实的有差别，出于政治缘故，所以画国界时不要采用GMT自带的数据，网上有正确的国界数据。
- 中国主要断层
- 青藏地区的断层（好像只包含了位于国内的断层，GitHub上有整个青藏的断层，可以直接去搜索）
- 南海九段线
- 中国行政边界


下载地址：
[点此下载](https://pan.baidu.com/s/1lFDH0GZrjlidItcW6SMo7g)\
**密码：b2gw**\
以上信息大部分来自于GMT的QQ群，感谢提供资料的同学

---
### 持续更新中  
2018-9-29 于 杭州  
2018-10-27 于 回杭州路途  
2018-10-29 于 杭州  
2018-11-5 于杭州  
2018-11-6：增加psconvert转换为kml与geotiff。之前一直没发现投影对转换结果的影响，所以在坑里蹲了好久才终于在英文帮助文档下发现了这个问题。所以还以尽量用英文文档，比自带的help要详细。 
2018-11-14: 吐槽GMT对非经纬度坐标数据网格化的不支持。
2018-11-17：增加网格配准方式  

--- 
注：整个系列是从有道云笔记中复制过来的，主要以有道云为主，简书会不定时与有道云同步更新,简书没有层级目录，不太好用，对这个系列有兴趣可以关注我分享的笔记：[GMT](http://note.youdao.com/noteshare?id=7fb4d5db7dac4127ce461915bc912521)
