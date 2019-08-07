# Setup4Wikipedia2Vec (Setup4w2v)

## Motivation

This project seeks to make it easier to install, train, and use wikipedia2vec. It builds a Docker image with w2v and
related software prepackaged for easy deployment wherever Docker containers may be run. w2v has been pip installed in
"editable" mode, which allows the user to make changes to the source on the instance without having to reinstall or
rebuild the image.

## Installation

1. `./build_image.sh`
2. `ln -s [PATH_TO_PRETRAINED_MODEL_DUMP_DIR] mount`
3. `/run_container.sh`
