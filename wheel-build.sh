#!/bin/bash 

#==================================================================
#
# Script Name	: wheel-build.sh                                                                                            
# Description	: Auto build package to Pypi                                                                                
# Args          : -                                                                                          
# Author       	: kanchen Monnin (kanchen.monnin@adjust.co)                                             
#
#==================================================================

# Create a source archive and a wheel for the package
python setup.py sdist bdist_wheel

# Build everything needed to install
python setup.py build

# List the contents of the tar source archive
tar tzf dist/rdmi-1.0.0.tar.gz

# Install Twine tool
python3 -m pip install --user --upgrade twine

# Check on the files created in dist
python3 -m twine check dist/*

# Upload package to Pypi
python3 -m twine upload dist/*
