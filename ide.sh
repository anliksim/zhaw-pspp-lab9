#!/bin/bash

# Runs emacs with common lisp support and mounts it to the X11 socket

CURRENT_DIR=$(pwd)
WORK_DIR="/usr/local/share/common-lisp/source"

docker run --rm -it -d \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v "${CURRENT_DIR}":"${WORK_DIR}" \
  -w "${WORK_DIR}" \
  -e "DISPLAY=unix${DISPLAY}" \
  --name emacs-clisp \
  ericzhu5121/emacs-clisp-x11
