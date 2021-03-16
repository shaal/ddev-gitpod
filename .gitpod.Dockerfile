FROM gitpod/workspace-full
SHELL ["/bin/bash", "-c"]

# Install projector and PhpStorm
RUN sudo apt-get -qq update && sudo apt-get -qq install -y python3 python3-pip libxext6 libxrender1 libxtst6 libfreetype6 libxi6
RUN pip3 install projector-installer
# Fragile - will break when they change options
RUN mkdir -p ~/.projector/configs  # Prevents projector install from asking for the license acceptance
RUN printf "8\nY\n3\n" | projector install --no-auto-run

# Install ddev
RUN brew update && brew install drud/ddev/ddev

