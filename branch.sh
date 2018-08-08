#!/bin/sh
# this is for directory structure if you want use other wise leave it
#mkdir $1 && cd $1 && mkdir $2 && cd $2 && mkdir $3 && cd $3
read -p 'enter number of branches:' num
c=1
while [ $c -le $num ]
do
        read -p "enter the url:" url
        read -p "enter branch name:" branch
        rm -rf .
        git clone $url
        OUTPUT=$(ls) && dir="${OUTPUT}"
        echo $dir
        #dir=ls| awk '{print}'
        #dir=${PWD##*/}
        cd $dir
        file=$(ls) && f2="${file}"
        echo $f2
        pjt= git branch -r
        #if [pjt]
        if [ -z $pjt ]
                then
                touch README.md
                git add README.md
                git commit -m "add README.md"
                git push origin master
                git checkout -b $branch
                git push origin $branch
                echo "-----------------------New branch created-------------------------"
        else
                ob=git branch -r|sed -n '2p'|sed 's/origin\///'|tr -d ' '
                git checkout -b $ob
                git checkout -b $branch
                git push origin $branch
                echo "--------------Branch created from existing branch-----------------"
        fi
c=`expr $c + 1`
done

