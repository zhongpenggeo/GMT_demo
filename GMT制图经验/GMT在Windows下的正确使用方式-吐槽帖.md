### GMT在Windows下的四种使用方式（安装Windows版GMT）
1.  直接用cmd或powershell执行bat脚本
2. 用cygwin执行shell脚本
3. 用git bash 执行shell脚本
4. 用Ubuntu子系统执行shell脚本（在子系统下安装了linux版GMT）
### 四种方式比较
1. bat脚本，放弃吧
2. cygwin貌似比较大，安装不是很方便，不是很了解
**这里重点介绍后两种**
#### 子系统和git比较
1. 速度：不确定MS是如何把Ubuntu嵌入Windows系统中的，总之，使用GMT时速度慢了不止一倍。
2. 结果：经过测试，这两种方式得到的结果是一致的
3. **错误输出：**  
用git bash执行GMT时部分错误信息无法输出。  
测试：
> gmt psxy -JX2c R10/20/10/20 -K -T >test.ps

在这句话中，R选项少了-，明显是个错误，但是在git bash中没有输出错误信息。

![image.png](https://upload-images.jianshu.io/upload_images/7955445-8fa9ee6414cb01ec.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

在powershell中：

![image.png](https://upload-images.jianshu.io/upload_images/7955445-1f9e76515ba825d4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

有错误输出！    
奇怪的powershell和git bash调用的都是同一个安装地址的GMT，所以错误信息的根源可能在于git bash。  
立帖吐槽！
