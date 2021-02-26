# docker-configs

This repo contains:

* my favourite configurations for emacs, tmux, zsh
* some dockerfiles for building development environments using (a) these configurations + (b) others utilities

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

**Configuration:**

* emacs: 

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

**emacs-docker:**

Emacs docker is the basis container, offering the following utilities:

* zsh, oh-my-zsh, fonts-powerline
* emacs26, tmux
* git, git-lfs
* sudo, 
* wget, curl
* evince

Build command: (must be run inside Dockerfile.emacs directory)

```
docker build -f ./Dockerfile.emacs -t givasile/emacs-docker \
    --build-arg USER_ID=$(id -u) \
    --build-arg GROUP_ID=$(id -g) \
    --build-arg USER=$(whoami) \
.
```
Default arguments:

* USER is mandatory
* USER_ID=1000
* GROUP_ID=1000
* TZ=Europe/Athens

Run command: 

```
docker run -it \
    --mount type=bind,source=/home/givasile/.ssh,target=/home/givasile/.ssh \
    --mount type=bind,source=`pwd`,target=/home/givasile/project \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e DISPLAY="unix$DISPLAY" \
    givasile/emacs-docker:latest'
```

Normaly, I use the following alias inside .zshrc, for using it easily

```
alias emacs-docker = docker run -it \
    --mount type=bind,source=/home/givasile/.ssh,target=/home/givasile/.ssh \
    --mount type=bind,source=`pwd`,target=/home/givasile/project \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e DISPLAY="unix$DISPLAY" \
    givasile/emacs-docker:latest'
```

Now, inside the directory you would like to edit something with emacs, just write `emacs-docker` and a fully functional emacs environment will be ready out-of-the-box.

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
**tex-docker**

tex-docker = emacs-docker + texlive-full

Contains: 

* emacs-docker
* latex environment

Build command: (emacs-docker must have been built first)

```
docker build -f ./Dockerfile.emacs -t givasile/emacs-docker
```

TODO: if emacs-docker is not built already, ask for arguments and build it on the fly

Run command:

```
docker run -it \
    --mount type=bind,source=/home/givasile/.ssh,target=/home/givasile/.ssh \
    --mount type=bind,source=`pwd`,target=/home/givasile/project \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e DISPLAY="unix$DISPLAY" \
    givasile/tex-docker:latest'
```

I normally use the alias `tex-docker`.



