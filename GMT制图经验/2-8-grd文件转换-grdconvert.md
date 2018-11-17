### 命令：`grdconvert`
解决的问题：  
.grd后缀的文件实际上有很多种格式，标准的格式是netcdf，但是有时候输入文件并不是标准的netcdf，而是其他写入格式的，比如surfer 6 的TXT格式。这种格式在GMT绘图时会出现种种问题。  
#### 问题
当R选项的范围比实际的范围小的时候，绘制出来的图会与边框有很多缝隙,或者直接会发生偏移，如图：  

![nanhai_surfer.jpg](https://upload-images.jianshu.io/upload_images/7955445-a418c70de8ecbc68.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)

而正确的结果应当是：  

![nanhai_netcdf.jpg](https://upload-images.jianshu.io/upload_images/7955445-ef5e207180efae38.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)


而且，就算用grdcut把文件区域裁剪下来还是可能会出现这些问题。

---
#### 解决办法
最好的解决办法就是把其他格式的grd文件转化成netcdf标准格式    
**命令：grdconvert**  
用法：
> gmt grdconvert inputgrd=id -Goutgrd=id 

有时候加入-N，不输出头段数据，在之后使用grdraster时有用
id表示grd文件格式的代码   
**那么如何知道文件格式代码呢**  
> gmt grdinfo nanhai_surfer.grd  

> nanhai_surfer.grd: Title: Grid imported via GDAL                                                                        nanhai_surfer.grd: Command:                                                                                             nanhai_surfer.grd: Remark:                                                                                              nanhai_surfer.grd: Gridline node registration used [Cartesian grid]                                                     nanhai_surfer.grd: Grid file format: gd = Import/export through GDAL                                                    nanhai_surfer.grd: x_min: 105.0083 x_max: 120.0083 x_inc: 0.202702702703 name: x n_columns: 75                          nanhai_surfer.grd: y_min: 5.002 y_max: 24.9926 y_inc: 0.201925252525 name: y n_rows: 100                                nanhai_surfer.grd: z_min: -128.49 z_max: 328.43 name: z                                                                 nanhai_surfer.grd: scale_factor: 1 add_offset: 0 

第五行：grid file format： gd= import/export through GDAL  
表示这个文件的格式代号是gd  
所以利用**grdconvert**把grd文件转换格式后，再用GMT绘图就没有问题了。


通常grdconvert可以自动识别grd的格式，完成转换，若不能识别，再使用a.grd=id手动加入id网格文件格式。
GMT netCDF format (32-bit float, COARDS, CF-1.5)

---
**更多资料**  
[GMT目录](https://www.jianshu.com/p/321f67983c42)
