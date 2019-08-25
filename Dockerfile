FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    default-jre \
    git \
    htop \
    maven \
    python3 \
    python3-pip \
    python3-venv \
    vim

ARG home_dir="/w2v"
ARG build_dir="$home_dir/build"
ARG user="w2v"

RUN useradd -m $user
WORKDIR "$home_dir"
RUN chown $user "$home_dir"
USER $user

COPY setup4w2v "$build_dir"
RUN python3 -m venv venv
# (Nearly) equivalent to activating the venv
ENV PATH="$home_dir/venv/bin:$PATH" \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    MWDUMPER_PATH="$home_dir/mwdumper"
RUN pip install -U pip

RUN "$build_dir/install_w2v.sh"
RUN pip install -r "$build_dir/extra_requirements.txt"

RUN "$build_dir/install_mwdumper.sh"
RUN cp "$build_dir/mwdumper.sh" "$home_dir"

# Cleanup
USER root
RUN rm -rf "$build_dir"

USER $user
