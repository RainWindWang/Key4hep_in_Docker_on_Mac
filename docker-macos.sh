# docker image:
docker_tag=ghcr.io/aidasoft/el9:latest

# if you want to color your vim, add these two lines to the docker run command:
##    -v ./init-vim-color.sh:/root/init-vim-color.sh \
##   /root/init-vim-color.sh  # this line has to be at the end of the command

# OR: this is a home made el9 with vim-enhanced pre-installed
#docker_tag=el9-vim-enhanced

xhost +localhost
echo "Starting ${docker_tag}"

docker run -ti --net=host --rm -e DISPLAY=host.docker.internal:0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v /cvmfs:/cvmfs:shared \
    -v $PWD:$PWD -w $PWD \
    --cpus="2" --memory="4g" \
    ${docker_tag} "$@"
