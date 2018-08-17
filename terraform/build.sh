#!/bin/bash

TERRAFORM_VERSION=$(cat .version)

docker build --build-arg TERRAFORM_VERSION=${TERRAFORM_VERSION} -t iwanomoto/terraform:${TERRAFORM_VERSION}-alpine -f "Dockerfile.alpine" .
docker build --build-arg TERRAFORM_VERSION=${TERRAFORM_VERSION} -t iwanomoto/terraform:${TERRAFORM_VERSION}-scratch -f "Dockerfile.scratch" .

## latest
docker build --build-arg TERRAFORM_VERSION=${TERRAFORM_VERSION} -t iwanomoto/terraform:latest -f "Dockerfile.alpine" .
