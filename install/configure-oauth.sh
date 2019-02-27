#!/bin/bash

ID=myClientId
SECRET=myClientSecret
REDIRECT_URI=http://ip:8084/login

MY_IP=`curl -s ifconfig.co`

hal config security authn oauth2 edit \
  --client-id $ID \
  --client-secret $SECRET \
  --provider github
hal config security authn oauth2 enable

hal config security authn oauth2 edit --pre-established-redirect-uri $REDIRECT_URI

hal config security ui edit \
    --override-base-url http://${MY_IP}:9000

hal config security api edit \
    --override-base-url http://${MY_IP}:8084