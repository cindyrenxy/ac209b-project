#!/bin/bash
set -e  # stop on error

echo "Downloading data from OSF..."
wget -O whgy6.zip "https://files.osf.io/v1/resources/whgy6/providers/osfstorage/?zip="

echo "Unzipping data..."
mkdir -p data
unzip -q whgy6.zip -d data/
# rm whgy6.zip

# unzipped the tar files
echo "Unzipping tar files..."
cat data/MiDaS-60_large/MiDaS-60.tar.* | tar -xf - -C data/MiDaS-60_large
cat data/MiDaS-60_small/MiDaS-60.tar.* | tar -xf - -C data/MiDaS-60_small

# clear up the directories
echo "Cleaning up directories..."
mv data/MiDaS-60_large/MiDaS-60/* data/MiDaS-60_large/
mv data/MiDaS-60_small/MiDaS-60_small/* data/MiDaS-60_small/
rmdir data/MiDaS-60_large/MiDaS-60
rmdir data/MiDaS-60_small/MiDaS-60_small

# remove the tar files
rm data/MiDaS-60_large/MiDaS-60.tar.*
rm data/MiDaS-60_small/MiDaS-60.tar.*