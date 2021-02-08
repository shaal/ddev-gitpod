hosts=$( tail -n 1 /etc/hosts )
hostwithspace=$(awk '{print $1}' <<< "$hosts")
hostip="${hostwithspace#' '}"

echo 'version: "3.6"' > .ddev/docker-compose.xdebug-ip.yaml
echo 'services:' >> .ddev/docker-compose.xdebug-ip.yaml
echo '  web:' >> .ddev/docker-compose.xdebug-ip.yaml
echo '    extra_hosts:' >> .ddev/docker-compose.xdebug-ip.yaml
echo -n '      - "host.docker.internal:' >> .ddev/docker-compose.xdebug-ip.yaml
echo -n $hostip >> .ddev/docker-compose.xdebug-ip.yaml
echo "\"" >> .ddev/docker-compose.xdebug-ip.yaml