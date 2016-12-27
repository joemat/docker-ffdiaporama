# docker-ffdiaporama
A docker container running ffdiaporama (http://ffdiaporama.tuxfamily.org/)

Since it's no possible to run the current version of ffdiaporama on my Linux Mint 18.1 machine I built this Docker image to run it.

* ffdiaporama is run by a user with UID 1000
* the user is added to the `audio` group to have access to the audio device
** this works fine on my Linux Mint 18.1 host running the container but may not work on different distributions when the id of the audio group is different
* the directory `$HOME/ffdiaporama` is passed as the user's home to the container

## Build and start the container from the scratch

    git clone https://github.com/joemat/docker-ffdiaporama
    cd docker-ffdiaporama
       
    # (optional: adjust UID, GUI and User in Dockerfile)
    
    sudo docker build -t ffdiaporama .
    sudo bash ./start_container.sh


## Downlaoding and starting the container from docker hub


    mkdir -p "$HOME/ffdiaporama"
    xhost +localhost
    sudo docker run --rm -it \
                    --net host \
                    -v /tmp/.X11-unix:/tmp/.X11-unix \
                    -e DISPLAY \
                    --device /dev/snd \
                    --name ffdiaporama \
                    -v $HOME/ffdiaporama:/home/ffdiaporama \
                    joemat/ffdiaporama


