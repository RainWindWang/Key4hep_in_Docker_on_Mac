# docker image:
# el9 for acts 32, centos7 for acts 13

docker_tag=ghcr.io/aidasoft/el9:latest
#docker_tag=ghcr.io/aidasoft/centos7:latest

# if you want to color your vim in the container, add these two lines to the docker run command:
##    -v ./init-vim-color.sh:/root/init-vim-color.sh \
##   /root/init-vim-color.sh  # this line has to be at the end of the command

# OR: use a home-made image with vim-enhanced pre-installed and terminal color pre-configured
#docker_tag=el9-color-enhanced
#docker_tag=centos7-color-enhanced

xhost +localhost
echo "Starting ${docker_tag}"

docker run -ti --net=host --rm -e DISPLAY=host.docker.internal:0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v /cvmfs:/cvmfs:shared \
    -v $PWD:$PWD -w $PWD \
    --cpus="2" --memory="4g" \
    ${docker_tag} "$@"
