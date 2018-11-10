#########################################################################
# File Name: ps2picture.sh
# Author: pengzhong
# mail: zhongpenggeo@163.com
# Created Time: Mon 05 Nov 2018 09:56:34 PM CST
#########################################################################
#!/bin/bash

PS=topo_ps.ps      
OUTNAME=ps2picture

gmt psconvert $PS -W+k -V 
