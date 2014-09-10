#!/bin/bash

VERSION=2014.1

NUGET=/usr/local/bin/NuGet.exe

# Clean the output folders
rm -rf src/*.log
rm -rf src/htmldoc
rm -rf src/monodoc
rm -rf src/icons
rm -rf src/msxdoc

# Get the latest (not prerelease) packages
mono $NUGET install OxyPlot.XamarinIOS -o packages
mono $NUGET install OxyPlot.XamarinAndroid -o packages

# Create documentation
. create-doc.sh

# Create the component
. create-component.sh