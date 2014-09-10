#!/bin/sh

cd src

# Folders
ICONS=../../oxyplot/Icons
BIN=../bin
OUTPUT=../out

echo Removing old files
rm -v bin/*
rm -v icons/*
rm -v $OUTPUT/*.xam

echo "Copying binaries"
if [ ! -d "bin" ]; then
  mkdir bin
fi

cp -v $BIN/OxyPlot.dll bin
cp -v $BIN/OxyPlot.XamarinIOS.dll bin
cp -v $BIN/OxyPlot.XamarinAndroid.dll bin

echo "Copying icons"
if [ ! -d "icons" ]; then
  mkdir -v icons
fi
cp -v $ICONS/OxyPlot_128.png icons/OxyPlot_128x128.png
cp -v $ICONS/OxyPlot_256.png icons/OxyPlot_256x256.png
cp -v $ICONS/OxyPlot_512.png icons/OxyPlot_512x512.png

VERSION=${VERSION:=2014.1}

OUTPUTPACKAGE=$OUTPUT/OxyPlot-$VERSION.xam

if [ ! -d "$OUTPUT" ]; then
  mkdir -v $OUTPUT
fi

echo "Creating Xamarin Component: $OUTPUTPACKAGE"
mono /usr/local/bin/xamarin-component.exe create-manually "$OUTPUTPACKAGE" \
    --name="OxyPlot" \
    --publisher="oxyplot.org" \
    --website="http://oxyplot.org/" \
    --monodoc="doc" \
    --srcurl="https://github.com/oxyplot/oxyplot" \
    --summary="A cross-platform plotting library for .NET" \
    --screenshot="OxyPlot running on Xamarin.iOS":"content/Screenshot_700x400.png"\
    --popover="content/Popover_320x200.png" \
    --details="content/Details.md" \
    --license="content/License.md" \
    --getting-started="content/GettingStarted.md" \
    --icon="icons/OxyPlot_128x128.png" \
    --icon="icons/OxyPlot_256x256.png" \
    --icon="icons/OxyPlot_512x512.png" \
    --library="ios":"bin/OxyPlot.dll" \
    --library="ios":"bin/OxyPlot.XamarinIOS.dll" \
    --library="android":"bin/OxyPlot.dll" \
    --library="android":"bin/OxyPlot.XamarinAndroid.dll" \
    --sample="iOS Sample. Demonstrates how to create a view with a line plot on iOS.":"samples/OxyPlotSample.iOS.sln" \
    --sample="Android Sample. Demonstrates how to create a view with a line plot on Android. ":"samples/OxyPlotSample.Android.sln"

ls -al $OUTPUT/OxyPlot*.xam

cd ..