FROM gitpod/workspace-base
SHELL ["/bin/bash", "-c"]

RUN sudo apt-get -qq update

# Install required libraries for Projector + PhpStorm
RUN sudo apt-get -qq install -y python3 python3-pip python3-crypto libxext6 libxrender1 libxtst6 libfreetype6 libxi6

# update PATH
RUN export PATH=/home/gitpod/.sdkman/candidates/maven/current/bin:/home/gitpod/.sdkman/candidates/java/current/bin:/home/gitpod/.sdkman/candidates/gradle/current/bin:/home/gitpod/.rvm/gems/ruby-2.6.6/bin:/home/gitpod/.rvm/gems/ruby-2.6.6@global/bin:/home/gitpod/.rvm/rubies/ruby-2.6.6/bin:/home/gitpod/.pyenv/plugins/pyenv-virtualenv/shims:/home/gitpod/.pyenv/shims:/workspace/.cargo/bin:/workspace/.pip-modules/bin:/workspace/.rvm/bin:/ide/bin:/home/gitpod/.pyenv/bin:/home/gitpod/.pyenv/shims:/workspace/go/bin:/home/gitpod/go/bin:/home/gitpod/go-packages/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin/:/home/gitpod/.nvm/versions/node/v14.16.1/bin:/home/gitpod/.cargo/bin:/home/gitpod/.rvm/bin

# Update pip
RUN python3 -m pip install -U pip
# Install Projector
RUN pip3 install projector-installer --user

# Install PhpStorm
# Prevents projector install from asking for the license acceptance
RUN mkdir -p ~/.projector/configs
RUN projector install 'PhpStorm 2021.1.3' --no-auto-run

# Install brew
RUN git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
RUN mkdir -p ~/.linuxbrew/bin
RUN ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin
RUN eval $(~/.linuxbrew/bin/brew shellenv)

# Install ddev
RUN brew install drud/ddev/ddev

###
### Initiate a rebuild of Gitpod's image by updating this comment #1
###
