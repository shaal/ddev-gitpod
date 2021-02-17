FROM gitpod/workspace-full
SHELL ["/bin/bash", "-c"]
# Install ddev
RUN brew update && brew install drud/ddev/ddev

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/
