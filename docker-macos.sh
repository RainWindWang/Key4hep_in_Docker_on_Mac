docker_tag=ghcr.io/aidasoft/el9:latest

xhost +localhost
echo "Starting ${docker_tag}"

docker run -ti --net=host --rm -e DISPLAY=host.docker.internal:0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v /cvmfs:/cvmfs:shared \
    -v $PWD:$PWD -w $PWD \
    --cpus="2" --memory="4g" \
    ${docker_tag} "$@"
