#!/bin/bash

if [ "x${narambunet_work}" == "x" ];
then
  narambunet_work=$HOME/narambunet/wdir
fi
echo "Narambu net work directory is at ${narambunet_work}"
if [ ! -d "${narambunet_work}" ];
then
  mkdir -p ${narambunet_work}
  python3 -V > /dev/null 2>&1
  if [ $? -ne 0 ];
  then
    echo "Python3 not detected"
    exit 1
  else
    echo "Detected: `python3 -V`"
    python3 -m venv "${narambunet_work}"
    source ${narambunet_work}/bin/activate
    pip install --upgrade pip
    deactivate
  fi
fi
source ${narambunet_work}/bin/activate
if [ -e "./requirements.txt" ];
then
  pip install -r ./requirements.txt
else
  echo "Keep requirements.txt in the same directory as this script. Run this script from its directory"
  exit 1
fi
export narambunet_work