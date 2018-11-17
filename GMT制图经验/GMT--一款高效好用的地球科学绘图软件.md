#### GMT是什么
GMT全称是Generic Mapping Tools，是一个开源的地理绘图和笛卡尔数据集处理（包括滤波，趋势拟合，网格化，投影等）软件。  
使用人数：  

![GMT全球分布](http://upload-images.jianshu.io/upload_images/7955445-ffd77148883b9549.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)

#### GMT能做什么
它既能绘制简单的x-y图像，也可以绘制带照明的曲面图像（surface）甚至三维图像。  
详情参见：[GMT官方网站](http://gmt.soest.hawaii.edu/projects/gmt)
#### GMT提供的API
GMT为以下几种语言提供了API，方便它们直接调用GMT绘制图：
1. Fortran
2. Julia
3. MATLAB
4. Python
#### GMT总结
GMT到底可以绘制什么图？以上的介绍都是来源于官网。从我个人经验来讲，对于地球科学而言，GMT是一款必备的科学可视化软件。它的**优势**在于：
1. 对地形数据、地理数据（国界、河流、海岸线）的天然支持
2. 绘制的图形非常精美，自带的色标非常漂亮，可直接作为发表图件
3. 可定制化程度非常高
4. 最重要的一点，自动化程度很高，通过脚本批量处理同一类型的数据成图。
**劣势**：
1. 门槛略高，对初学者不是很友好
2. 没有GUI界面，没有编程基础的人学起来有些吃力
3. 可定制化程度高，意味着不能快速成图，没有脚本的积累要自己写则比较费时。
#### GMT实例
以上都是文字，无法形成直观的印象，下面我直接上图，大家看完就知道GMT到底能干嘛了。  
这些图件来源于：GMT自带的example和我自己绘制的一些图件。
1. 3D图

![夏威夷地形](https://upload-images.jianshu.io/upload_images/7955445-5feb434a550d41f9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![青藏高原三维地形图](https://upload-images.jianshu.io/upload_images/7955445-4ed557e18350f97f.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![surface](https://upload-images.jianshu.io/upload_images/7955445-a85cf23b88117836.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![三维柱状图/另类三维地形图](https://upload-images.jianshu.io/upload_images/7955445-3e52a4a4767a13ba.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![三维柱状图-世界语言分布图](https://upload-images.jianshu.io/upload_images/7955445-51d28740c4b9a09a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)

3. 地震图

![洋中脊的地震分布图](https://upload-images.jianshu.io/upload_images/7955445-fd99af7f41165737.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![洋中脊的地震波形](https://upload-images.jianshu.io/upload_images/7955445-a128fcf1f3da2114.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)

3. 一般

![直方图和玫瑰图](https://upload-images.jianshu.io/upload_images/7955445-aba29713eaa2f983.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![测网](https://upload-images.jianshu.io/upload_images/7955445-326990e780909966.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![缺失数据](https://upload-images.jianshu.io/upload_images/7955445-7f3e8ebfc45fbacf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![surface网格化和滤波](https://upload-images.jianshu.io/upload_images/7955445-2953376e5d558adf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![只绘制海洋区域的大地水准面](https://upload-images.jianshu.io/upload_images/7955445-19e267b3746240f8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![二维x-y图--时间轴（ex21）](https://upload-images.jianshu.io/upload_images/7955445-da581e4bce94dbfc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![轨迹图--大圆路径](https://upload-images.jianshu.io/upload_images/7955445-0d35b7f5db3253c4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![海洋重力（ex26）](https://upload-images.jianshu.io/upload_images/7955445-27f3c0ae3fae4b42.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![UTM数据与投影（ex28）](https://upload-images.jianshu.io/upload_images/7955445-41829ae124d696c1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![火星地形图--上下两图为不同格林函数样条插值方法](https://upload-images.jianshu.io/upload_images/7955445-0b06cb76f981d98b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![地形图上叠加位图（ex32）](https://upload-images.jianshu.io/upload_images/7955445-c33a8fd48db259cb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![从2D图上提取剖面（ex33）](https://upload-images.jianshu.io/upload_images/7955445-f8203ed1e85ec272.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![地形图上勾勒国界（ex34）](https://upload-images.jianshu.io/upload_images/7955445-f40b54eaf73be256.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![实测水深与卫星重力的相关度（ex37）](https://upload-images.jianshu.io/upload_images/7955445-e69acbeea39f7849.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![不同直方图均衡化绘图的效果](https://upload-images.jianshu.io/upload_images/7955445-67307548982c7e9b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![南极（ex42）](https://upload-images.jianshu.io/upload_images/7955445-98fbe0ad484d0349.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![趋势拟合图](https://upload-images.jianshu.io/upload_images/7955445-625cbc065b776a53.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![洋壳深度（ex49）](https://upload-images.jianshu.io/upload_images/7955445-3b6e1a083a4bb288.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)

4. 地理绘图

![欧洲首都位置分布](https://upload-images.jianshu.io/upload_images/7955445-58fc60ad3aabfae8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![地理绘图](https://upload-images.jianshu.io/upload_images/7955445-9c88f102ec82c5f2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![日夜分界线（ex46）](https://upload-images.jianshu.io/upload_images/7955445-5f296a259dd9c30d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
![机场分布于覆盖范围（ex48））](https://upload-images.jianshu.io/upload_images/7955445-d80bfb0d61991e61.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)




4.unkown

![image.png](https://upload-images.jianshu.io/upload_images/7955445-c41d43748b8ddf82.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)

#### 更多资料  
[GMT目录](https://www.jianshu.com/p/321f67983c42)  
[Windows下安装gmt](https://www.jianshu.com/p/3f1e2d62d73a)   
[GMT绘制GPS速度矢量图](https://www.jianshu.com/p/94792ab8ec97)  
[GMT制图专题](https://www.jianshu.com/c/1cc3a57914f9)
