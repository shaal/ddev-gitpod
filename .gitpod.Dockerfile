FROM gitpod/workspace-full

# Install ddev
RUN brew tap drud/ddev && brew install ddev

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/
