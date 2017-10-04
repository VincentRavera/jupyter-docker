#!/bin/bash
# Use this file as alias to launch a ipython container

if [ -z $1 ]; then
    # No workspace named !
    # Not linking any volume !
    echo "RUNNING : docker run -it vincentravera/jupyter-docker ipython3"
    docker run -p 8888:8888 -d vincentravera/jupyter-docker
elif [ -d $1 ] ; then
    # Workspace was found !
    workspace=$(realpath $1)
    echo "RUNNING : docker run -v $workspace:/home/ -it vincentravera/jupyter-docker ipython3"
    docker run -v $workspace:/home/ -p 8888:8888 -d vincentravera/jupyter-docker
fi
