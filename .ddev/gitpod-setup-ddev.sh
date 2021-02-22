#!/usr/bin/env bash

# Set up ddev for use on gitpod

set -eu -o pipefail

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Remove all docker containers and images,
# because of gitpod bug: https://github.com/gitpod-io/gitpod/issues/3174
docker rm -f $(docker ps -aq) || true
docker system prune --force


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
mkcert -install
ddev config global --instrumentation-opt-in=true --router-bind-all-interfaces=true

ddev start
echo Your website is available at this url:
gp url 8080
