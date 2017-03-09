#!/bin/env bash

git submodule init
git submodule update

root=`pwd`

find fwdpy -name '*.so' | xargs rm -f
find fwdpy -name '*.cpp' | xargs rm -f
cd fwdpy 
git submodule init
git submodule update
python setup.py build_ext -i --use-cython
cd docs
make html
cd $root
rm -rf docs
cp -r fwdpy/docs .
cp fwdpy/README.rst .
