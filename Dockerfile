FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-pip \
    python3-venv \
    vim

ARG dir="/w2v"
ARG user="w2v"

RUN useradd -m $user
WORKDIR $dir
RUN chown $user $dir
USER $user

COPY setup4w2v ./build
RUN python3 -m venv venv
# (Nearly) equivalent to activating the venv
ENV PATH="$dir/venv/bin:$PATH" \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8
RUN pip install -U pip

RUN ./build/install_w2v.sh
RUN pip install -r ./build/extra_requirements.txt

# Cleanup
USER root
RUN rm -rf ./build

USER $user
