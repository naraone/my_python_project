#!/bin/bash
scripts_dir=`pwd`
project_dir=$(dirname "${scripts_dir}")
cd ${project_dir}
source ./setupvenv.sh
python ./src/application.py
