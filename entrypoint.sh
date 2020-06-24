#!/bin/sh -l

GO_PATH=/usr/local/go/bin/go

CMD=$1
WORK_DIR=$2

echo -e "\033[36mRunning GO command: go $CMD\033[0m"

if [ -z "$WORK_DIR" ] 
then
    $GO_PATH $CMD
else 
    cd $WORK_DIR && $GO_PATH $CMD
fi
