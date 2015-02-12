#!/bin/sh

# Folders
OUTPUT=../out

cd src

# make/clean out location
echo "Removing old files"
rm -v $OUTPUT
if [ ! -d "$OUTPUT" ]; then
mkdir -v $OUTPUT
fi

# get the remote icons
echo "Copying icons"
if [ ! -d "$OUTPUT/icons" ]; then
mkdir -v $OUTPUT/icons
fi
curl -L "https://raw.githubusercontent.com/oxyplot/oxyplot/develop/Icons/OxyPlot_128.png" -o $OUTPUT/icons/OxyPlot_128x128.png
curl -L "https://raw.githubusercontent.com/oxyplot/oxyplot/develop/Icons/OxyPlot_512.png" -o $OUTPUT/icons/OxyPlot_512x512.png

# package component
echo "Creating Xamarin Component"
xamarin-component package

# move component to out location
mv *.xam $OUTPUT

cd ..