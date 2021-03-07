#!/bin/sh

###############################################################
# This script will:                                           #
# 1. Create an IAM Administrators group                       #
# 1. Create an IAM Datadog user                               #
# 2. Add the IAM Datadog user to the IAM Administrators group #
###############################################################

GROUP="Administrators"
POLICY="arn:aws:iam::aws:policy/AdministratorAccess"
USER="Datadog"

# create an IAM group
aws iam create-group --group-name $GROUP

# confirm the group was created
echo "IAM groups:"
aws iam list-groups

# attach the policy to the group
aws iam attach-group-policy --group-name $GROUP --policy-arn $POLICY

# confirm the policy was attached to the group
echo "IAM policies in $GROUP group:"
aws iam list-attached-group-policies --group-name $GROUP

# create an IAM user
aws iam create-user --user-name $USER

# add the IAM user to the IAM group
aws iam add-user-to-group --user-name $USER --group-name $GROUP

# verify the IAM group contains the IAM user
echo "IAM users in $GROUP group:"
aws iam get-group --group-name $GROUP
