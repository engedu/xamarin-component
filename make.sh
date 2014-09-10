#!/bin/bash

VERSION=2014.1

NUGET=/usr/local/bin/NuGet.exe

# Clean the output folders
rm -rf src/*.log
rm -rf src/htmldoc
rm -rf src/monodoc
rm -rf src/icons
rm -rf src/msxdoc

# Get the latest packages
mono $NUGET install OxyPlot.XamarinIOS -o packages -Prerelease
mono $NUGET install OxyPlot.XamarinAndroid -o packages -Prerelease

# Copy all assemblies to a bin folder
if [ ! -d "bin" ]; then
  mkdir bin
fi

find packages -iname '*.dll' -exec cp \{\} bin/ \;
find packages -iname '*.pdb' -exec cp \{\} bin/ \;
find packages -iname '*.xml' -exec cp \{\} bin/ \;

# Create documentation
. create-doc.sh

# Create the component
. create-component.sh