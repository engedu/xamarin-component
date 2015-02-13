#!/bin/sh

# Folders
OUTPUT=../out

cd src

# The package version to create the component for
VERSION=$1

# create the component version number
IFS='-' read -a split_version <<< "$VERSION"
NUGET_VERSION=$VERSION
COMPONENT_VERSION=${split_version[0]}

# get the remote icons
echo "Copying icons"
if [ ! -d "icons" ]; then
mkdir -v icons
fi
curl -L "https://raw.githubusercontent.com/oxyplot/oxyplot/develop/Icons/OxyPlot_128.png" -o icons/OxyPlot_128x128.png
curl -L "https://raw.githubusercontent.com/oxyplot/oxyplot/develop/Icons/OxyPlot_512.png" -o icons/OxyPlot_512x512.png

# set component.yaml version numbers
sed -i -bak "s/NUGET_VERSION/$NUGET_VERSION/g" component.yaml
sed -i -bak "s/COMPONENT_VERSION/$COMPONENT_VERSION/g" component.yaml

# package component
echo "Creating Xamarin Component"
xamarin-component package

# move component to out location
echo "Move old files"
if [ ! -d "$OUTPUT" ]; then
mkdir -v $OUTPUT
fi
mv *.xam $OUTPUT

cd ..