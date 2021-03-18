FROM gitpod/workspace-full
SHELL ["/bin/bash", "-c"]

# Install projector 
RUN sudo apt-get -qq update && sudo apt-get -qq install -y python3 python3-pip libxext6 libxrender1 libxtst6 libfreetype6 libxi6
RUN pip3 install projector-installer
# Install PhpStorm
RUN mkdir -p ~/.projector/configs  # Prevents projector install from asking for the license acceptance
RUN projector install 'PhpStorm 2020.3.3'

# Install ddev
RUN brew update && brew install drud/ddev/ddev

