#!/bin/bash

export NODE_IP=10.0.1.18

helm uninstall traefik

helm install \
  --set="service.type=NodePort,service.spec.externalIPs={$NODE_IP},service.spec.externalTrafficPolicy=Local,additionalArguments={--providers.kubernetesingress,--log=true,--log.level=INFO,--accesslog=true}" \
  traefik traefik/traefik
