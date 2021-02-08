fullgpurl=$GITPOD_WORKSPACE_URL
shortgpurl="${fullgpurl#'https://'}"
echo 'additional_fqdns:' > .ddev/config.fqdns.yaml
echo -n ' - ' >> .ddev/config.fqdns.yaml
echo -n 8080- >> .ddev/config.fqdns.yaml
echo $shortgpurl >> .ddev/config.fqdns.yaml
