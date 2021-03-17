#!/usr/bin/env bash

# Set up ddev for use on gitpod

set -eu -o pipefail

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Remove docker containers and specific docker images,
# because of gitpod bug: https://github.com/gitpod-io/gitpod/issues/3174
containers_found="$(docker ps -aq)"
if [[ ! -z "$containers_found" ]]; then
    docker rm -f $containers_found || true
fi

images_found="$(docker images | awk '/^drud\/ddev-(webserver|ssh-agent|dbserver)/ { print $3 }')"
if [[ ! -z "$images_found" ]]; then
    docker rmi -f $images_found
fi

# Generate a config.gitpod.yaml that adds the gitpod
# proxied ports so they're known to ddev.
shortgpurl="${GITPOD_WORKSPACE_URL#'https://'}"

cat <<CONFIGEND > ${MYDIR}/config.gitpod.yaml
#ddev-gitpod-generated
router_http_port: 8080
router_https_port: 8443
use_dns_when_possible: false

additional_fqdns:
- 8080-${shortgpurl}
- 8025-${shortgpurl}
- 8036-${shortgpurl}
CONFIGEND

# We need host.docker.internal inside the container,
# So add it via docker-compose.host-docker-internal.yaml
hostip=$(awk "\$2 == \"$HOSTNAME\" { print \$1; }" /etc/hosts)

cat <<COMPOSEEND >${MYDIR}/docker-compose.host-docker-internal.yaml
#ddev-gitpod-generated
version: "3.6"
services:
  web:
    extra_hosts:
    - "host.docker.internal:${hostip}"
COMPOSEEND

# Misc housekeeping before start
ddev config global --instrumentation-opt-in=true --router-bind-all-interfaces=true

ddev start
echo Your website is available at this url:
gp url 8080
