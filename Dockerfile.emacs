# Fully-customed latex working environment (TEX + GIT + EMACS + TMUX)

# pull base ubuntu image
FROM ubuntu:20.04

# set timezone
ARG TZ=Europe/Athens
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# make terminal non-interactive
ENV DEBIAN_FRONTEND noninteractive

# install apt-level packages
RUN echo 'APT::Get::Assume-Yes "true";' >> /etc/apt/apt.conf
RUN apt-get update
RUN apt-get upgrade

# install packages
RUN apt-get install git \
    software-properties-common \
    evince \
    curl \
    fonts-powerline \
    wget \
    sudo \
    tmux \
    zsh

# install emacs26 
RUN add-apt-repository ppa:kelleyk/emacs
RUN apt-get update
RUN apt-get -y install emacs26

# args
ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER=givasile
ARG HOME=/home/$USER

# Set environmental vars
ENV TERM screen
ENV ZSH_THEME agnoster

# install oh-my-zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# install git lfs
WORKDIR $HOME
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
RUN wget https://github.com/git-lfs/git-lfs/releases/download/v2.13.2/git-lfs-linux-amd64-v2.13.2.tar.gz
RUN mkdir tmp1
RUN tar -xf git-lfs-linux-amd64-v2.13.2.tar.gz -C ./tmp1
RUN rm git-lfs-linux-amd64-v2.13.2.tar.gz
RUN cd tmp1
RUN ls -al
RUN ./tmp1/install.sh
RUN cd ..
RUN rm -rf tmp1

# add user
RUN addgroup --gid $GROUP_ID $USER
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID $USER

# copy/install all configs to $HOME
WORKDIR $HOME
COPY ./emacs $HOME/.emacs.d
COPY ./tmux/.tmux.conf $HOME/
COPY ./git/.gitconfig $HOME/
# COPY ./ssh $HOME/.ssh
RUN mkdir ~/.tmux/
RUN mkdir ~/.tmux/plugins
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# chown -> user
RUN chown -R $USER:$USER $HOME
USER $USER

# set up git lfs
RUN git lfs install

# create project dir
WORKDIR $HOME
RUN mkdir project
WORKDIR $HOME/project

ENTRYPOINT ["/bin/zsh"]