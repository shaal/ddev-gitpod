# Remove specific docker images, because of a gitpod bug
images_found=$(docker images | awk '/^drud\/ddev-(webserver|ssh-agent)/ { print $3 }')
if [[ "$images_found" ]]; then
    docker rmi -f $images_found
fi

mkcert -install
ddev config global --instrumentation-opt-in=true --router-bind-all-interfaces=true
.ddev/gitpod-generate-overrides.sh
.ddev/gitpod-generate-fqdns.sh
.ddev/gitpod-generate-xdebug-host-ip.sh
ddev start
echo Your website is available at this url:
echo $(gp url 8080)
