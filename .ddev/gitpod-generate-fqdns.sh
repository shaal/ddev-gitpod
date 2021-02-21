fullgpurl=$GITPOD_WORKSPACE_URL
shortgpurl="${fullgpurl#'https://'}"
echo 'additional_fqdns:' > .ddev/config.fqdns.yaml

echo -n ' - 8080-' >> .ddev/config.fqdns.yaml
echo $shortgpurl >> .ddev/config.fqdns.yaml

echo -n ' - 8025-' >> .ddev/config.fqdns.yaml
echo $shortgpurl >> .ddev/config.fqdns.yaml

echo -n ' - 8036-' >> .ddev/config.fqdns.yaml
echo $shortgpurl >> .ddev/config.fqdns.yaml

#cat >>-END > .ddev/config.fqdns.yaml
#$shortgpurl - 8080
