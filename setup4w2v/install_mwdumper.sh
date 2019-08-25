#!/bin/bash
set -eo pipefail

git clone https://phabricator.wikimedia.org/diffusion/MWDU/mwdumper.git
cd mwdumper || exit
mvn compile
mvn package
