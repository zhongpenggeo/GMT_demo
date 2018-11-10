#########################################################################
# File Name: test_movie.sh
# Author: pengzhong
# mail: zhongpenggeo@163.com
# Created Time: Fri 09 Nov 2018 09:05:05 PM CST
#########################################################################
#!/bin/bash
rm -r topo3D
gmt movie topo3D.sh -Ntopo3D -T70 -Agif -C35cx35cx100
