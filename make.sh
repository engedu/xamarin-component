#!/bin/bash

VERSION=2015.1.728-alpha

echo Creating OxyPlot Xamarin component version $VERSION

# Install the latest OxyPlot.Xamarin NuGet packages
. install-packages.sh $VERSION

# Create documentation
. create-doc.sh $VERSION

# Create the component
. create-component.sh $VERSION