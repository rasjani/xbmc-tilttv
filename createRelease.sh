#!/bin/sh
# TODO: Add version from latest git tag
VERSION=0.1

rm -rf ./releases/tmp/
mkdir ./releases/${VERSION}
mkdir -p ./releases/tmp/plugin.video.tilt.tv/resources/language/English
#mkdir -p ./releases/tmp/plugin.video.tilt.tv/resources/language/Finnish
mkdir -p ./releases/tmp/plugin.video.tilt.tv/resources/lib

cp ./addon.py ./releases/tmp/plugin.video.tilt.tv
cp ./addon.xml ./releases/tmp/plugin.video.tilt.tv
cp ./changelog.txt ./releases/tmp/plugin.video.tilt.tv
cp ./fanart.png ./releases/tmp/plugin.video.tilt.tv
cp ./icon.png ./releases/tmp/plugin.video.tilt.tv
cp ./LICENSE.txt ./releases/tmp/plugin.video.tilt.tv
cp ./README.md ./releases/tmp/plugin.video.tilt.tv
cp ./resources/__init__.py ./releases/tmp/plugin.video.tilt.tv/resources/
cp ./resources/language/English/strings.xml ./releases/tmp/plugin.video.tilt.tv/resources/language/English
# cp ./resources/language/Finnish/strings.xml ./releases/tmp/plugin.video.tilt.tv/resources/language/Finnish
cp ./resources/lib/__init__.py ./releases/tmp/plugin.video.tilt.tv/resources/lib
cd releases/tmp/
zip -r ../${VERSION}/plugin.video.tilt.tv.zip plugin.video.tilt.tv/*
