#!/bin/bash

docker run -it \
  --mount type=bind,source="$PWD"/mount,target=/w2v/mount,readonly \
  --mount type=bind,source="$PWD"/mount/sampled_wikidata,target=/w2v/mount/sampled_wikidata \
  w2v:latest
