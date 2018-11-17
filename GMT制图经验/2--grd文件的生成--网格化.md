只有三个命令：`xyz2grd`, `surface`, `nearneighbor`
1. xyz2grd:要求数据是等间隔的，否则绘制出来的图形有灰色条纹。
用法: 相对比较简单，见中文文档，或百度，示例：
```
 RR=55/145/5/60
FI=ETOPO1.xyz
GRD=Li_topo.grd
gmt xyz2grd -I1m/1m  -V $FI -G$GRD -R$RR
```
> xyz2grd是GMT中的一个模块，把xyz三列的数据转换为grd网格数据  
-I表示设置间隔，这里的1m/1m表示经度间隔是1弧分，纬度是1弧分（这个间隔需要自己根据xyz文件计算出来，手动输入），并且，这个间隔必须要正确，或者绘制出来的图形有灰色条纹。  
-V表示显示运行信息  
\$FI是shell脚本中一种变量引用格式，这里指代输入文件，即ETOPO1.xyz文件  
-G为设置输出文件，$GRD是输出文件名，这里是Li_topo.grd  
-R表示设置输出数据的范围，这个范围要比ETOPO1.xyz的范围小  

2. surface：对不等间隔的数据做网格化操作，使用的是全局的数据，算法是根据文献：  
Smith, W. H. F., and P. Wessel, Gridding with continuous curvature splines in tension, Geophysics, vol. 55 (3), pp. 293-305, 1990.  
注意：为避免网格化后出现空间假频，先用blockmean对数据预处理。  
命令：
```
blockmean –R245/255/20/30 –I5m –V ship.xyz > ship_5m.xyz   
surface ship_5m.xyz –R245/255/20/30 –I5m –Gship.nc –V
``` 

3. nearneighbor：对不等间隔的数据做网格化操作，使用邻近数据做计算
用法：
> nearneighbor –R245/255/20/30 –I5m –S40k –Gship.nc –V ship.xyz 

> -R为设置数据输出范围  
-I为设置网格化间隔，这里是5弧分  
-S为设置搜索半径。40k表示40km。有了结点，有了搜索半径，即可搜索出该结点附近分布的点值了  
-G为设置输出文件，ship.nc  
ship.xyz 为输入文件  
注：当数据较密时，适合用该方法。  

**这三种网格化的算法可以参考：[xyz2grd、surface和nearneighbor](https://www.jianshu.com/p/9b961e3e1290)**  

---

**更多资料**  
[GMT目录](https://www.jianshu.com/p/321f67983c42)
