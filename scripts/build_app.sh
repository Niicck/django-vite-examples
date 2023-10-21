#!/bin/bash
set -e -a

CURRENT_DIR=`dirname "${BASH_SOURCE[0]}"`

sh $CURRENT_DIR/_docker_compose.sh build $@
