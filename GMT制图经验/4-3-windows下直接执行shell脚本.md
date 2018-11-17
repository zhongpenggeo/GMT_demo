目的：
1. windows下bat文件比较烦，它的变量命名和Linux不太一样，要用%，有点烦
2. 可以直接执行别人写好的gmt脚本
3. 传统的方法是安装cygwin，但个人感觉比较繁琐，这里只是为了执行GMT的shell脚本，因此使用一种比较简单的方法
 
步骤；
1. 安装Windows版本的gmt（比Linux下简单）
2. 安装Git Shell，它安装了一些常用的Linux工具，如ged，unix2dos等（如果想直接编写shell文件，建议安装notepad++，在里面编辑，效果很好）。
3. 在shell脚本所在的文件夹空白处右键-->Git Bash here
4. 可能需要输入命令：
> unix2dos xxx.sh

因为unix和Windows换行符不一样，转换一下以免系统转换时出错或无法执行的情况
5. 直接像在Linux中执行GMT一样：
>  ./xxx.sh

执行gmt脚本（**注意这里不会输出错误或警告信息，这点比较坑**）

---
**更多资料**  
[GMT目录](https://www.jianshu.com/p/321f67983c42)
