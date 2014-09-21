#!/bin/bash

VERSION=${1-2014.1}

echo Creating OxyPlot Xamarin component version $VERSION

# Install the latest OxyPlot.Xamarin NuGet packages
. install-packages.sh

# Create documentation
. create-doc.sh

# Create the component
. create-component.sh