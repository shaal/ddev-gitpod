FROM gitpod/workspace-full
SHELL ["/bin/bash", "-c"]
# Install ddev
RUN brew update && brew install drud/ddev/ddev

# Install projector and PhpStorm
RUN apt update && apt install -y python3 python3-pip libxext6 libxrender1 libxtst6 libfreetype6 libxi6
RUN pip3 install projector-installer
# Fragile - will break when they change options
RUN printf "8\ny\n3\n" | projector install --no-auto-run
