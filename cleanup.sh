docker rm -f -v $(docker ps -f name=${PWD##*/} -aq)
