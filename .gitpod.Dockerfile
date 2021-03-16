FROM gitpod/workspace-full
SHELL ["/bin/bash", "-c"]

# Install projector and PhpStorm
RUN sudo apt-get update && sudo apt-get install -y python3 python3-pip libxext6 libxrender1 libxtst6 libfreetype6 libxi6
RUN pip3 install projector-installer
# Fragile - will break when they change options
#RUN printf "y\n" | projector
RUN printf "y\n8\ny\n3\n" | projector install --no-auto-run

# Install ddev
RUN brew update && brew install drud/ddev/ddev

