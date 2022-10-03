#!/bin/bash
major=$1
file=/var/lib/jenkins/version
pre_version=`cat $file`
pre_major=`cat $file | awk -F. '{print $1}'`
echo $major
#echo "VERSION:$VERSION"
if [ $major == $pre_major ]
then
        #echo "Major versions are equal"
        CURR_VERSION=$(echo $pre_version | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}')
        echo $CURR_VERSION > $file
        echo $CURR_VERSION
else
        echo "Major versions are not equal"
        echo $major.0.0 > $file
fi
