#!/bin/bash
set -eo pipefail

# Adapted from https://wikipedia2vec.github.io/wikipedia2vec/install/
git clone https://github.com/studio-ousia/wikipedia2vec.git
cd wikipedia2vec || exit
pip install -r requirements.txt
./cythonize.sh
pip install -e .
