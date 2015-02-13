#!/bin/bash

# Clean the output folders
rm -rf src/*.log
rm -rf src/htmldoc
rm -rf src/monodoc
rm -rf src/icons
rm -rf src/msxdoc
rm -rf packages
rm -rf out
rm -rf bin

# Get the latest packages
nuget install OxyPlot.Core -o packages -Version $1
nuget install OxyPlot.Mobile -o packages -Version $1

# Copy all assemblies to a bin folder
if [ ! -d "bin" ]; then
  mkdir bin
fi

find packages -iname '*.dll' -exec cp \{\} bin/ \;
find packages -iname '*.pdb' -exec cp \{\} bin/ \;
find packages -iname '*.xml' -exec cp \{\} bin/ \;