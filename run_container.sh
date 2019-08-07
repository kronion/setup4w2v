#!/bin/bash

docker run -it --mount type=bind,source="$PWD"/mount,target=/w2v/mount,readonly w2v:latest
