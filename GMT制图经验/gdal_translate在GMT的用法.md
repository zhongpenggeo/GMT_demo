#### gdal_translate的好处
1. GMT的特点之一就是擅长绘制带地理坐标的图形，—J选项中就定义了大量的投影转换。
2. 对地球科学而言，大量的信息都和其地理位置相关，比如断层，河流、山脉等。
基于以上两点，gdal对于GMT而言是一个“贤内助”，学会gdal，对于GMT来说助力非常大！  

#### 图片格式转换
1. 把geotiff转为GMT支持的grd
> gdal_translate of GMT input.tiff output.nc  

若没有安装gdal，也可以直接在surfer里面转出来。

2. 把带坐标信息的jpg和jpw转换为geotiff（jpg是图片，jpw是坐标信息文件，两者必须同名且在同一个目录下）  
> gdal_translate of GSBG iput.jpg output.tif  

#### 多波段数据分离成单波段  
有时候得到的geotiff是多波段的数据，无法转成GMT支持的grd格式，先要把他们转成单波段的。  
> gdal_translate -b 1 input.tif  output.tif    
1表示第一个波段，还可以改成2, 3；这样多波段（rgb）既可以分离为3个波段。  
然后再转换为GMT支持的grd。   

#### 更改投影系统
把墨卡托投影（或其他投影）转换为带经纬度的WGS84坐标系。  
> gdalwrap -s_srs def -t_srs def input.tif output.tif 

> s_srs是源投影系统    
> t_srs是目标投影系统  
> 有几种定义投影系统的方式，比如常用的，直接写WGS84  
> 或者用EPSG:number来定义，自己可以搜索对应投影系统的EPSGnumber；

#### 重定义投影系统
> gdal_translate  -a_srs def  input.tif output.tif 

---
#### 更多资料  
[GMT目录](https://www.jianshu.com/p/321f67983c42)  
[Windows下安装gmt](https://www.jianshu.com/p/3f1e2d62d73a)   
[GMT绘制GPS速度矢量图](https://www.jianshu.com/p/94792ab8ec97)  
[GMT制图专题](https://www.jianshu.com/c/1cc3a57914f9)


