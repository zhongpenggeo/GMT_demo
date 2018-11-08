#!/bin/bash

#gmt begin gmt-map pdf,jpg
gmt set FONT_TITLE=24p,Helvetica-Bold
gmt begin map jpg
gmt subplot begin 2x2 -Ff10c/10c:3,1/2,2
gmt subplot set 1,1
gmt grdimage Tibet_topo.grd -R70/110/15/45 -Jx -B10 -Cetopo1
gmt subplot set 1,2
gmt grdimage Tibet_topo.grd -R70/110/15/45 -Jx -B5 -Cetopo1
gmt subplot set 2,1
gmt grdimage Tibet_topo.grd -R70/110/15/45 -Jx -B5 -Cetopo1
gmt subplot set 2,2
gmt grdimage Tibet_topo.grd -R70/110/15/45 -Jx -B10 -Cetopo1
gmt subplot end
gmt end 
gmt clear all

#gmt end
