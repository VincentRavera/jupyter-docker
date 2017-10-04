#!/bin/bash
# Use this file as alias to launch a ipython container

if [ -z $1 ]; then
    # No workspace named !
    # Not linking any volume !
    echo "RUNNING : docker run -it vincentravera/jupyter-docker ipython3"
    docker run -it vincentravera/jupyter-docker ipython3
elif [ -d $1 ] ; then
    # Workspace was found !
    workspace=$(realpath $1)
    echo "RUNNING : docker run -v $workspace:/home/ -it vincentravera/jupyter-docker ipython3"
    docker run -v $workspace:/home/ -it vincentravera/jupyter-docker ipython3
elif [ -f $1 ] ;then
    directory=$(dirname $1)
    workspace=$(realpath $directory)
    filename=$(basename $1)
    echo "RUNNING : docker run -v $workspace:/home -it vincentravera/jupyter-docker ipython3 -i $filename"
    docker run -v $workspace:/home -it vincentravera/jupyter-docker ipython3 -i $filename
fi
