#!/bin/bash
set -e  # stop on error

echo "Downloading data from OSF..."
wget -O whgy6.zip "https://files.osf.io/v1/resources/whgy6/providers/osfstorage/?zip="

echo "Unzipping data..."
mkdir -p data
unzip -q whgy6.zip -d data/
echo "Done!"
# rm whgy6.zip