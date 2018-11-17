主要命令：
- grdcut
- grdpast
1. 用grdcut把grd文件的数值范围减小：
> gmt grdcut grav_148_162_8_32.grd -Ggrav_150_160_10_30.grd -R150/160/10/30 -V

grav_148_162_8_32.grd为输入文件
-G后面表示输出文件，即输出grav_150_160_10_30.grd
-R是输出范围：即经度150~160，纬度10-30
-V表示显示运行过程的信息
2. 把两个grd文件拼接起来
> gmt grdpaste file_a.grd file_b.grd -Goutfile.grd    

把file_a.grd和file_b.grd拼接称为一个文件，即outfile.grd

---
**更多资料**  
[GMT目录](https://www.jianshu.com/p/321f67983c42)
