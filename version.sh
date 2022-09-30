#!/bin/bash
VERSION=`cat /var/lib/jenkins/version`
echo $major_ver
echo "VERSION:$VERSION"
CURR_VERSION=$(echo $VERSION | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}')
echo $CURR_VERSION > /var/lib/jenkins/version
echo $CURR_VERSION
