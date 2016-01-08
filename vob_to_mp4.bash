#!/bin/bash
# bash ./script.bash FOLDER EXTENSION
FOLDER=$1
EXTENSION=$2
# Helper ----------------------------------------------------------- #
# cd /data/yug/projects_active/MOOC/books/
rm -f ./tmp/*
mkdir -p ./tmp/

files=(`ls ./ | grep [0-2].VOB$ | sed 's/.VOB//'`) 
for i in "${!files[@]}"
do 
	echo "Convert videos: ${files[${i}]}" 
	ffmpeg -i ./${files[${i}]}.VOB -c:v mpeg4 -b:v 1600k -g 300 -bf 2 -c:a libmp3lame -b:a 128k ./tmp/${files[${i}]}.mp4
done
