#!/bin/bash

NUMBER=$1
NAME=$2

if [ ! -d data ]; then
    mkdir data
fi

if [ ! -d clipped ]; then
    mkdir clipped
fi

if [ ! -d osm ]; then
    mkdir osm
fi

if [ -f data/$NUMBER.zip ];
then
  echo "File already downloaded"
else
  echo "Downloading file"
  wget -O data/$NUMBER.zip http://www.eea.europa.eu/data-and-maps/data/clc-2006-vector-data-version/$NUMBER-$NAME/clc06_c$NUMBER.zip/at_download/file
fi

unzip -o data/$NUMBER.zip -d data

ogr2ogr clipped/$NUMBER.shp data/clc06_c$NUMBER.shp -clipsrc 4400000 3800000 4500000 3900000 -overwrite

python ogr2osm/ogr2osm.py clipped/$NUMBER.shp 

mv $NUMBER.osm osm/
