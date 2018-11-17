> To contour the file hawaii_grav.grd every 25 mGal on a Mercator
map at 0.5 inch/degree, annotate every 50 mGal (using fontsize =
10), using 1 degree tickmarks, and draw 30 minute gridlines:

用法：
> grdcontour hawaii_grav.grd −Jm0.5i −C25 −A50+f10
−B1g30m > hawaii_grav.ps

-S：加入该选项可以平滑等值线  
-A表示设置标注，这里50+f10表示每隔50标注一个数字，f为设置字体，这里字体大小是10  
-C设置等值线间隔，这里25表示每隔25画一条等值线  
-B设置轴的刻度和标识。  

--- 
**更多资料**  
[GMT目录](https://www.jianshu.com/p/321f67983c42)
