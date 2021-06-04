FROM gitpod/workspace-base
SHELL ["/bin/bash", "-c"]

RUN sudo apt-get -qq update

# Install required libraries for Projector + PhpStorm
RUN sudo apt-get -qq install -y python3 python3-pip libxext6 libxrender1 libxtst6 libfreetype6 libxi6

# Install Projector
RUN pip3 install projector-installer

# Install PhpStorm
RUN mkdir -p ~/.projector/configs  # Prevents projector install from asking for the license acceptance
RUN projector install 'PhpStorm 2021.1.3' --no-auto-run

# Install brew
RUN git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
RUN mkdir ~/.linuxbrew/bin
RUN ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin
RUN eval $(~/.linuxbrew/bin/brew shellenv)

# Install ddev
RUN brew install drud/ddev/ddev

###
### Initiate a rebuild of Gitpod's image by updating this comment #1
###
