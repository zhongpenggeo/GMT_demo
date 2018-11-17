在GMT中，最常用的地图就是地形图，本文要讲的就是**高精度地形图如何在Windows中使用**。

![etopo1数据成图效果展示](https://upload-images.jianshu.io/upload_images/7955445-61b50b8596eab835.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
  
#### 高精度地形图简介
1.  etopo1：精度为1弧分，约为1~2km，覆盖范围是全球（即包括南北极）
2. etopo5：与etopo1类似，精度为5弧分，现在用的人比较少了。
3. GEBCO，精度为30弧秒，覆盖范围是全球
4. SRTM30和STRM15：精度分别为30弧秒和15弧秒，范围是纬度-81~81
5. **SRTM3**：精度为3弧秒，大约80m，只覆盖纬度-60~60的区域，中国完全覆盖，所以研究国内区域可以使用该高精度地形数据
6. ASTER GDEM：精度1弧秒，不太了解。可以参考：[地形起伏数据](https://www.cnblogs.com/mazhenyu/p/4218923.html)
数据下载及介绍参见：[GMT中文社区地形起伏数据](https://gmt-china.org/datas/)
#### SRTM3介绍
美国航空航天局NASA在2000时利用奋进号航天飞机上的雷达测观测所得，是以前用得最多的高程数据，覆盖了全球南北纬60度以内的区域。有SRTM1和SRTM3两种，即分别是1角秒和3角秒精度的数据，对应精度为30米和90米。谷歌地球所使用高程数据即为SRTM3。公开出来的覆盖中国区域的只有90米精度。中科院镜像可以下载  
参考资料：[DLR、ASTER GDEM、SRTM3、GMTED2010等5种全球高程数据对比](http://blog.sina.com.cn/s/blog_720f853f01014hub.html)  
**问题**  
SRTM数据把全球分成很多不同的块，其数据也相应打包成不同的压缩包，若要绘制一个较大区域的地形，则需要选择相应的数据包，解压和拼接。

![SRTM-reCoordinate.png](https://upload-images.jianshu.io/upload_images/7955445-af8abdb75386883e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)

#### 拼接工具安装
- **工具（Linux下这两个工具可能已经安装了，这里只讲Windows下的安装）：**  
1. GDAL地理数据转换器，[64位下载](http://download.osgeo.org/osgeo4w/osgeo4w-setup-x86_64.exe)
2. bc计算器，[点此下载](https://phoenixnap.dl.sourceforge.net/project/gnuwin32/bc/1.06-2/bc-1.06-2.exe)
- 安装
安装方式与Windows下一般软件一致，但需要注意，要把这两个软件的安装地址加入PATH环境变量中。具体方式请参考：[Windows系统添加PATH路径](https://blog.csdn.net/Mr_Cat123/article/details/78698220)
#### 运行脚本拼接数据
1. 找到STRM3所在目录，空白处右键打开git bash
2. 输入
>./ cutsrtm3-new.sh  outfilename.grd min_longitude max_longitude min_latitude max_latitude    

max_logngitude表示感兴趣区域的最小经度值，后面三个参数类似，要用具体数值代替。outfilename要用具体文件名代替。。
3. 本目录下可以找到outfilename.grd这个文件，这就是地形数据生成的网格文件，可以直接在GMT下绘制地形图。绘制地形图参见：[GMT绘制精美地形图](https://www.jianshu.com/p/97b2a202baa8)

---
更新：  
发现GMT自带一种更简单下载的方式, 可以直接在命令行输入。    

> Some data sets are ubiquitous and used by nearly all GMT users. At the moment this set is limited to Earth relief grids. If you reference files called earth_relief_res.grd on a command line then that grid will automatically be downloaded from the GMT Data Site and placed in $GMT_USERDIR [~/.gmt]. The resolution res allows a choice among 13 command grid spacings: 60m, 30m, 20m, 15m, 10m, 6m, 5m, 4m, 3m, 2m, 1m, 30s, and 15s (with file sizes 111 kb, 376 kb, 782 kb, 1.3 Mb, 2.8 Mb, 7.5 Mb, 11 Mb, 16 Mb, 27 Mb, 58 Mb, 214 Mb, 778 Mb, and 2.6 Gb respectively). Once one of these have been downloaded any future reference will simply obtain the file from $GMT_USERDIR (except if explicitly removed by the user). Note: The four highest resolutions are the original data sets SRTM15+, SRTM30+, ETOPO1 and ETOPO2V2. Lower resolutions are spherically Gaussian-filtered versions of ETOPO1.

即可以直接用erath_relief_30s.grd作为输入文件，gmt会自动下载SRTM 3的数据，存放在\~/.gmt中，\~在windows下一般是c:\Users\yourname  
考虑到在国内，估计网速……  
另一种可行的方法，下载ASCII的SRTM3数据，就是数据比较占空间，但可以直接用xyz2grd网格化，在GMT下使用很简单，就不需要cutsrtm3-new.sh脚本了。

---
#### 更多资料  
[GMT目录](https://www.jianshu.com/p/321f67983c42)  
[Windows下安装gmt](https://www.jianshu.com/p/3f1e2d62d73a)   
[GMT绘制GPS速度矢量图](https://www.jianshu.com/p/94792ab8ec97)  
[GMT制图专题](https://www.jianshu.com/c/1cc3a57914f9)  
[windows下直接执行GMT脚本](https://www.jianshu.com/p/d8c3dedf8b8f)
