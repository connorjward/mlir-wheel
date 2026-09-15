#! /bin/bash

LLVM_REPO_URL=https://github.com/???

# Read the version to release from the command line
version=$1

workdir="llvm-$version"

# Clone the appropriate LLVM branch into 'llvm-$version'
git clone --depth 1 --branch $version $LLVM_REPO_URL $workdir

# Patch the version number in the pyproject.toml - or use version=dynamic?
sed -i 'version=' pyproject.toml.template > $workdir/pyproject.toml

# Compile things
python -m build $workdir -o dist/$version

echo "Build complete, files are in dist/$version"
