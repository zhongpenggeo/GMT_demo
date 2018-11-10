### 2D topography
<img src="https://github.com/zhongpenggeo/GMT_demo/blob/master/GMT_picture/topo2D.jpg" width="400">

### 3D topography  
<img src="https://github.com/zhongpenggeo/GMT_demo/blob/master/GMT_picture/topo3D.jpg" width="400"> 

---

#### 目录说明
topo目录下主要是用GMT来绘制2D和3D地形图  
提供的Tibet\_topo.grd是西藏地区的etopo1地形数据，用以绘制地形图  
1. topo.sh 是用来绘制二维地形图的，关键命令/模块：grdgradient，grdimage  
注意grdgradient的重要性，考虑去除这一个命令及其生成的文件，观察不加入梯度有什么影响  
2. topo3D.sh是用来绘制3D地形图的，关键命令：grdview，关键参数，-p，控制方位角和高度视角。
