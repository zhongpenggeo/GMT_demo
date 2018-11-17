**声明**：本文部分资料来源于GMT中文社区的博客，该[博文](https://docs.gmt-china.org/install/windows/)是Windows下的标准安装方法，本文则是我自己认为比较方便的安装与使用方法。
#### 下载
1. 下载GMT：到GMT中文社区的社区主页的 [下载页面](https://gmt-china.org/download/) 下载所需要的安装包
2. 下载Ghostscript，[Ghostscript Downloads](https://www.ghostscript.com/download/gsdnld.html), **这个主要是用来把PS文件转换为一般的图片格式，如PDF和jpg等。如果你的GMT中psconvert命令无法使用，转换失败，可能是缺少这个软件**
错误信息一般如下：
![image.png](https://upload-images.jianshu.io/upload_images/7955445-7d2a44dc7ef26c63.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
3. 下载git：[点击此处下载Git for Windows 64-bit](https://github.com/git-for-windows/git/releases/download/v2.19.1.windows.1/Git-2.19.1-64-bit.exe)  
4. 下载notepad++：[点击此处下载notepad++](https://notepad-plus-plus.org/download/v7.5.9.html)；或其他软件：推荐vim
5.  下载Sumatra PDF：[点击此处下载Sumatra PDF](https://www.sumatrapdfreader.org/download-free-pdf-viewer.html)，或其他软件，如gsview

#### 安装
1. 安装gmt：直接双击安装包即可安装，直接点击下一步，使用默认的选项即可，无须做任何修改。在“选择组件”页面，建议将四个选项都勾选上，然后点击下一步安装完成。  
> 安装过程中可能会出现 "Warning! PATH too long installer unable to modify PATH! "的警告。出现此警告的原因是系统的环境变量 PATH 太长，GMT安装包无法直接修改。  
解决办法是，先忽略这一警告，待安装完成后按照如下步骤自行修改系统环境变量 PATH 。  
点击“计算机”->“属性”->“高级系统设置”->“环境变量”打开“环境变量”编辑工具
在“系统变量”部分中，选中“Path”并点击“编辑”
在“变量值”的最后加上GMT的安装路径。需要注意“path”变量值中多个路径之间用英文分号分隔   

2.  安装Ghostscript：按照Windows下一般的软件安装方式
3. 安装git：按照Windows下一般的软件安装方式
4. 安装notepad++：同上；
5. Sumatra PDF：绿色软件，免安装，

ok，安装完成
#### 使用
1. 打开git：空白处右键->git bash here  
![image.png](https://upload-images.jianshu.io/upload_images/7955445-3d0db17f5efab142.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
2. 输入
> gmt --help

![image.png](https://upload-images.jianshu.io/upload_images/7955445-eaabeb8494385a6e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)
gmt 安装成功

**gmt运行方式**  
e.g. 在gmt脚本所在目录下    
- 保险起见（避免dos系统和Linux系统文件格式的不同），先输入
> dos2unix topo.sh

- 再输入：
> ./topo.sh 

会在当前目录生成一个.ps文件。  
3. notepad++：该文件是用来编辑gmt脚本，即.sh文件的；用法：在sh文件上右键->Edit with notepad++  
4. Sumatra PDF：只需要在打开.ps文件时，右键->打开方式->在文件中浏览->（找到Sumatra PDF）  
只需要第一次用打开方式，后面双击默认ps文件用smartpdf打开。  

继续：[windows下使用GMT必看--吐槽帖](https://www.jianshu.com/p/39f04fa602d9)  
顺便介绍一下大神写的Linux下安装GMT的脚本。非常简单好用！[gmt-easy-installer](https://github.com/gmt-china/gmt-easy-installer)
***
#### 更新：
2018/10/30：忘了安装Ghostscript软件，导致无法转换ps文件，现已更新  
2018/11/2:  增加吐槽帖，因为git bash不输出错误信息，浪费我好多时间  
2018-11-5:  增加大神写的Linux下安装GMT的脚本  

---
**更多资料**  
[GMT绘制GPS速度矢量图](https://www.jianshu.com/p/94792ab8ec97)  
[GMT中使用高精度地形图STRM3](https://www.jianshu.com/p/5440b756cf74)  
[GMT制图专题](https://www.jianshu.com/c/1cc3a57914f9)  
[windows下直接执行GMT脚本](https://www.jianshu.com/p/d8c3dedf8b8f)  
[GMT目录](https://www.jianshu.com/p/321f67983c42)  
