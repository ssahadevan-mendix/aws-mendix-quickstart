#!/bin/bash

currentDate=`date +%m%d%y`
echo $currentDate

# Got to parent Directory
cd ..
currentDir=aws-mendix-quickstart-main

saveDir=$currentDir-$currentDate
mv $currentDir $saveDir

#Download latest
wget https://github.com/ssahadevan-mendix/aws-mendix-quickstart/archive/main.zip

unzip main.zip

cd $currentDir
mkdir save
cp * save

cp ../$saveDir/env.sh .

diff env.sh save

#cleanup
rm ../main.zip
