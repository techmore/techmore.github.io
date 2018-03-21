#!/bin/bash

rm -R techmore.github.io-master
rm master.zip
rm *.html *.jpg *.png *.bak 
wget https://github.com/techmore/techmore.github.io/archive/master.zip
unzip master.zip 
cd techmore.github.io-master
mv * ../*

