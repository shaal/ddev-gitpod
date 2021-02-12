FROM gitpod/workspace-full

# Install ddev
RUN brew install drud/ddev-edge/ddev
RUN mkdir -p ~/tmp/starter && pushd ~/tmp/starter && ddev config --auto && ddev start && delete -Oy

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/
