### Create component

The `make.sh` script installs the OxyPlot.Xamarin packages, builds the documentation and creates the component.
The component (.xam) is output to the `out/` folder.

### Component testing

The `test.sh` script unzips the .xam file to `out/latest/` and builds the `Release` and `Debug` configurations. The build logs are saved to `out/`.

### Show generated documentation

The `show-doc.sh` script does not work yet. See [macdoc](https://github.com/mono/monomac/tree/master/samples/macdoc) for more information. Please submit a pull request if you know how to fix this!