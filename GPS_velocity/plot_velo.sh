#!/bin/bash
#!/bin/bash
# 因为我的脚本基本是在Windows下用notepad++写的，
# 在Linux下运行需要做文件转换，即调用dos2unix。
# write by PZ
# 2018/7/29
dos2unix topo.sh
./topo.sh
dos2unix GPS_velo.sh
./GPS_velo.sh