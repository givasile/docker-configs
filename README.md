# docker-configs

This repo contains the follow ready-to-build and use docker set-ups:

* emacs-docker
* tex-docker

-------------------------------------------------------------------------------

**emacs-docker:** A ready-to-build environment with

* emacs26 - with my favourite plug-ins
* tmux, zsh, oh-my-zsh, fonts-powerline
* git, git-lfs
* wget, curl

Build command: (must be run inside Dockerfile.emacs directory)

```
docker build -f ./Dockerfile.emacs -t givasile/emacs-docker \
    --build-arg USER_ID=$(id -u) \
    --build-arg GROUP_ID=$(id -g) \
    --build-arg USER=$(whoami) .
```
Default arguments:

* USER is mandatory
* USER_ID=1000
* GROUP_ID=1000
* TZ=Europe/Athens

Run command: 

```
docker run -it --rm \
    --mount type=bind,source=/home/$USER/.ssh,target=/home/$USER/.ssh \
    --mount type=bind,source=`pwd`,target=/home/$USER/project \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e DISPLAY="unix$DISPLAY" \
    givasile/emacs-docker:latest
```

Normaly, I create an alias to `emacs-docker` command, by adding the following snippet at the .bashrc 

```
alias emacs-docker = docker run -it --rm \
    --mount type=bind,source=/home/$USER/.ssh,target=/home/$USER/.ssh \
    --mount type=bind,source=`pwd`,target=/home/$USER/project \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e DISPLAY="unix$DISPLAY" \
    givasile/emacs-docker:latest
```

Now, inside the directory you would like to edit something with emacs, just write `emacs-docker` and a fully functional emacs environment will be ready out-of-the-box.

-------------------------------------------------------------------------------

**tex-docker** = emacs-docker + texlive-full

Build command: (emacs-docker must have been built first)

```
docker build -f ./Dockerfile.latex -t givasile/tex-docker --build-arg USER=$(whoami) .
```

TODO: if emacs-docker is not built already, ask for arguments and build it on the fly

Run command:

```
docker run -it \
    --mount type=bind,source=/home/$USER/.ssh,target=/home/$USER/.ssh \
    --mount type=bind,source=`pwd`,target=/home/$USER/project \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e DISPLAY="unix$DISPLAY" \
    givasile/tex-docker:latest
```

I normally use the alias `tex-docker`.

-------------------------------------------------------------------------------

TODO:

* find a workaround for opening content in local browser from inside the docker
