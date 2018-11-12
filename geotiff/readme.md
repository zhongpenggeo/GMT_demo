这个文件主要是讲把tiff文件作为GMT的底图  
关键就是在于安装好gdal，然后用grdimag -D借用gdal把geotiff图片读入并按照-R的范围切除。  
但是之前一直遇到的问题是最初用的测试geotiff图片是我用psconvert转换来的，那个图片先做了墨卡托投影再转换为geotiff格式的，所以图片不再是经纬度而是墨卡托的投影坐标，导致我-R用的经纬度一直绘制不出来。   
现在终于解决了这个问题  
以后从geotiff开始作图（grdimage -D），最后又生成geotiff（psconvert -W+g），终于得到了我要的循环！  
goog！
