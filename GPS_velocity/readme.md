result(GPS velocity):  
![gps_velocity](../GMT_picture/gps_velocity.jpg)
#### 使用方法
1. topo.sh是用来绘制地形图的，
2. GPS\_velo.sh是添加GPS速度矢量到原来的地形图上，由于速度矢量可能需要多次调整参数，所以需要运行多次，故把绘制地形图部分单独写成一个脚本，这样修改速度参数时就不需要重新绘制地形图了
3. 先运行topo.sh，再运行GPS\_velo.sh

详细介绍请参考：[GPS速度场的绘制](https://www.jianshu.com/p/90d24a7861d8)

注：由于GPS速度的原始TXT数据可能不是公开的吗，这里只选取了少量数据作为实验的输入数据。GPS\_k.txt和GPS\_this.txt 是两个不同来源的数据，在绘制时用了两种颜色来显示
