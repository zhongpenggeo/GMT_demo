<meta charset="utf-8">

grd2cpt：可以不需要设定色彩范围和间隔，自动根据你的数据来，个人比较推荐（如果有极端值，grd2cpt可以自动在极端值处加密，减少极端值的色彩变化，这样便于观察主要数据的分布），但是要控制色标一致的话，恐怕不行！读取grid文件并制作cpt，cpt是根据现存的cpt动态调整，根据累计分布函数cumulative distribution function，所以是直方图均衡的，  

-Z：加入该项则使用离散的cpt（注意同一cpt可以分为离散和连续）；  

![1.png](https://upload-images.jianshu.io/upload_images/7955445-5c5cb2729d7c033a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)

![2.png](https://upload-images.jianshu.io/upload_images/7955445-7cc15e8a460c8fe9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)

**更多资料**
[GMT目录](https://www.jianshu.com/p/321f67983c42)
