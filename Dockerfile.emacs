# Fully-customed latex working environment (TEX + GIT + EMACS + TMUX)

# pull base ubuntu image
FROM ubuntu:20.04

# set timezone
ARG TZ=Europe/Athens
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# make terminal non-interactive
ENV DEBIAN_FRONTEND noninteractive

# install apt-level packages
RUN echo 'APT::Get::Assume-Yes "true";' >> /etc/apt/apt.conf &&\
		apt-get update &&\
		apt-get upgrade &&\
		apt-get install git \
    software-properties-common \
    evince \
    curl \
    fonts-powerline \
    wget \
    sudo \
    tmux \
    zsh \
		chromium-browser &&\
		add-apt-repository ppa:kelleyk/emacs &&\
		apt-get update &&\
		apt-get -y install emacs26

# args
ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER=givasile
ARG HOME=/home/$USER

# install oh-my-zsh and powerlevel10k - TODO check why pluggins do not work
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
    -p git &&\
		echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> ~/.zshrc # sources .p10k.zsh script in the end

# install git lfs
WORKDIR $HOME
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash &&\
		wget https://github.com/git-lfs/git-lfs/releases/download/v2.13.2/git-lfs-linux-amd64-v2.13.2.tar.gz &&\
		mkdir tmp1 &&\
		tar -xf git-lfs-linux-amd64-v2.13.2.tar.gz -C ./tmp1 &&\
		rm git-lfs-linux-amd64-v2.13.2.tar.gz &&\
		tmp1/install.sh &&\
		rm -rf tmp1

# add user
RUN addgroup --gid $GROUP_ID $USER &&\
		adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID $USER &&\
		adduser $USER sudo &&\
		echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# copy static configurations for emacs, tmux, git
WORKDIR $HOME
COPY ./emacs $HOME/.emacs.d
COPY ./tmux/.tmux.conf $HOME/
COPY ./git/.gitconfig $HOME/
COPY ./powerlevel10k/.p10k.zsh $HOME/

# install static configurations for emacs, tmux, git
RUN mkdir ~/.tmux/ &&\
		mkdir ~/.tmux/plugins &&\
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

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