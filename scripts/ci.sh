#!/bin/bash
set -o errexit

: ${TERRAFORM_VERSION:=0.6.14}
: ${TERRAFORM_PREFIX:=$HOME/bin}

if ! command -v terraform ; then
    mkdir -p "${TERRAFORM_PREFIX}"
    curl -o /tmp/terraform.zip -sSL "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
    unzip -o /tmp/terraform.zip -d $TERRAFORM_PREFIX
fi
