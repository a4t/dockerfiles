#!/bin/bash

TERRAFORM_VERSION=$(cat .version)

docker push iwanomoto/terraform:${TERRAFORM_VERSION}-alpine
docker push iwanomoto/terraform:${TERRAFORM_VERSION}-scratch

## latest
docker push iwanomoto/terraform:latest
