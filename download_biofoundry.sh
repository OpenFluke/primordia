#!/bin/bash

set -e  # exit on error

echo "[+] Cleaning old files..."
rm -f linux-beta-1_7_1.zip biofoundry.zip
rm -rf linux biofoundry

echo "[+] Downloading latest BioFoundry..."
wget -O linux-beta-1_7_1.zip https://openfluke.com/download-file/linux-beta-1_7_1.zip

echo "[+] Unzipping..."
unzip -o linux-beta-1_7_1.zip -d temp_extract

echo "[+] Moving game files to biofoundry/"
mkdir -p biofoundry
mv temp_extract/linux/* biofoundry/

echo "[+] Cleaning temp folder..."
rm -rf temp_extract

echo "[+] Creating biofoundry.zip..."
cd biofoundry
zip -r ../biofoundry.zip *
cd ..

echo "[+] Done!"
echo "Final output: biofoundry.zip with structure:"
echo "biofoundry/{game files here}"
