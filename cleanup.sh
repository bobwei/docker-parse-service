CURRENT_DIR=${PWD##*/}
DOCKER_SERVICE_NAME=${CURRENT_DIR//-/}
docker rm -f -v $(docker ps -f name=$DOCKER_SERVICE_NAME -aq)
