#!/bin/sh -l

CMD=$1
WORK_DIR=$2

echo -e "\033[36mRunning GO command: go $CMD\033[0m"
cd $WORK_DIR && go $CMD
