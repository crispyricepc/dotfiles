#!/usr/bin/env sh

which python3 > /dev/null &&
which pip > /dev/null &&
echo "Installing prerequesites..." &&
pip install pyyaml > /dev/null &&
echo "" &&

# Run the actual setup
python3 setup/setup.py