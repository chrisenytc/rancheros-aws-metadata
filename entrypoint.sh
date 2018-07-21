#!/bin/bash

set -e

# Set environment variables
export AWS_AVAILABILITY_ZONE=$(curl "http://169.254.169.254/latest/meta-data/placement/availability-zone" 2>/dev/null)
export AWS_DEFAULT_REGION="${AWS_AVAILABILITY_ZONE%?}"

export AWS_IAM_ROLE=$(curl "http://169.254.169.254/latest/meta-data/iam/security-credentials/" 2>/dev/null)

if [ "${AWS_IAM_ROLE}" ]; then
  export AWS_ACCESS_KEY_ID=$(curl "http://169.254.169.254/latest/meta-data/iam/security-credentials/${AWS_IAM_ROLE}" 2>/dev/null | jq -r .AccessKeyId)
  export AWS_SECRET_ACCESS_KEY=$(curl "http://169.254.169.254/latest/meta-data/iam/security-credentials/${AWS_IAM_ROLE}" 2>/dev/null | jq -r .SecretAccessKey)
  export AWS_SECURITY_TOKEN=$(curl "http://169.254.169.254/latest/meta-data/iam/security-credentials/${AWS_IAM_ROLE}" 2>/dev/null | jq -r .Token)
fi

export AWS_AMI_ID=$(curl "http://169.254.169.254/latest/meta-data/ami-id" 2>/dev/null)
export AWS_AMI_LAUNCH_INDEX=$(curl "http://169.254.169.254/latest/meta-data/ami-launch-index" 2>/dev/null)
export AWS_AMI_MANIFEST_PATH=$(curl "http://169.254.169.254/latest/meta-data/ami-manifest-path" 2>/dev/null)

export AWS_INSTANCE_ID=$(curl "http://169.254.169.254/latest/meta-data/instance-id" 2>/dev/null)
export AWS_INSTANCE_TYPE=$(curl "http://169.254.169.254/latest/meta-data/instance-type" 2>/dev/null)
export AWS_INSTANCE_ACTION=$(curl "http://169.254.169.254/latest/meta-data/instance-action" 2>/dev/null)

export AWS_HOSTNAME=$(curl "http://169.254.169.254/latest/meta-data/hostname" 2>/dev/null)
export AWS_LOCAL_HOSTNAME=$(curl "http://169.254.169.254/latest/meta-data/local-hostname" 2>/dev/null)
export AWS_LOCAL_IPV4=$(curl "http://169.254.169.254/latest/meta-data/local-ipv4" 2>/dev/null)
export AWS_PUBLIC_IPV4=$(curl "http://169.254.169.254/latest/meta-data/public-ipv4" 2>/dev/null)
export AWS_MAC_ADDRESS=$(curl "http://169.254.169.254/latest/meta-data/mac" 2>/dev/null)

export AWS_SECURITY_GROUPS=$(curl "http://169.254.169.254/latest/meta-data/security-groups" 2>/dev/null)

export AWS_RESERVATION_ID=$(curl "http://169.254.169.254/latest/meta-data/reservation-id" 2>/dev/null)

# Set config environment on rancher os

ros config set rancher.environment.AWS_AVAILABILITY_ZONE $AWS_AVAILABILITY_ZONE
ros config set rancher.environment.AWS_DEFAULT_REGION $AWS_DEFAULT_REGION

ros config set rancher.environment.AWS_IAM_ROLE $AWS_IAM_ROLE
ros config set rancher.environment.AWS_ACCESS_KEY_ID $AWS_ACCESS_KEY_ID
ros config set rancher.environment.AWS_SECRET_ACCESS_KEY $AWS_SECRET_ACCESS_KEY
ros config set rancher.environment.AWS_SECURITY_TOKEN $AWS_SECURITY_TOKEN

ros config set rancher.environment.AWS_AMI_ID $AWS_AMI_ID
ros config set rancher.environment.AWS_AMI_LAUNCH_INDEX $AWS_AMI_LAUNCH_INDEX
ros config set rancher.environment.AWS_AMI_MANIFEST_PATH $AWS_AMI_MANIFEST_PATH

ros config set rancher.environment.AWS_INSTANCE_ID $AWS_INSTANCE_ID
ros config set rancher.environment.AWS_INSTANCE_TYPE $AWS_INSTANCE_TYPE
ros config set rancher.environment.AWS_INSTANCE_ACTION $AWS_INSTANCE_ACTION

ros config set rancher.environment.AWS_HOSTNAME $AWS_HOSTNAME
ros config set rancher.environment.AWS_LOCAL_HOSTNAME $AWS_LOCAL_HOSTNAME
ros config set rancher.environment.AWS_LOCAL_IPV4 $AWS_LOCAL_IPV4
ros config set rancher.environment.AWS_PUBLIC_IPV4 $AWS_PUBLIC_IPV4
ros config set rancher.environment.AWS_MAC_ADDRESS $AWS_MAC_ADDRESS
ros config set rancher.environment.AWS_SECURITY_GROUPS $AWS_SECURITY_GROUPS
ros config set rancher.environment.AWS_RESERVATION_ID $AWS_RESERVATION_ID