#/bin/bash

EMAIL=your-email@address.com

curl http://localhost:8001/services \
  -d name=acme-dummy \
  -d tags=lets-encrypt \
  -d url=http://127.0.0.1:65535

curl http://localhost:8001/services/acme-dummy/routes \
  -d name=acme-dumy \
  -d tags=lets-encrypt \
  -d protocols=http \
  -d paths[]=/.well-known/acme-challenge

curl http://localhost:8001/plugins \
  -d name=acme \
  -d config.account_email=$EMAIL \
  -d config.tos_accepted=true \
  -d config.domains[]=app1.your.domain \
  -d config.domains[]=app2.your.domain \
  -d config.domains[]=app3.your.domain 
