# Terraform Ansible AWS Nginx Datadog

## Business Goals
1. Drive IT projects
1. Solve complex problems
1. Test innovative approaches
1. Research new solutions to storing, manipulating and presenting information
1. Integrate industry trends, emerging technologies and standards
1. Collaborate with experts to identify, evaluate and recommend technical solutions to support project requirements

## Architecture
1. Terraform - infrastructure as code
1. Ansible - configuration management
1. AWS - cloud computing services
1. NGINX - web server
1. Datadog - cloud monitoring service

## Demo

## Tutorial

### Requirements
1. [Set up an AWS account and create a user](https://docs.aws.amazon.com/polly/latest/dg/setting-up.html "Set up an AWS account and create a user")
	1. [Install AWS CLI Version 2](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html "Install AWS CLI Version 2")
3. Install curl
4. Install Ansible
	1. Install Datadog role from Ansible Galaxy: `ansible-galaxy install datadog.datadog`
2. [Set up a Datadog account](https://app.datadoghq.com/signup "Set Up a Datadog Account")
	2. [Integrate Amazon Web Services](https://app.datadoghq.com/account/settings#integrations/amazon-web-services "Integrate Amazon Web Services")
		1. [Find your API Key here](https://app.datadoghq.com/account/settings#api "Find Your API Key Here")
	2. [Integrate AWS EC2](https://app.datadoghq.com/account/settings#integrations/amazon_ec2 "Integrate AWS EC2")
	3. [Integrate Nginx](https://app.datadoghq.com/account/settings#integrations/nginx "Integrate Nginx")
2. Clone this project

### Create an IAM User and Group (AWS CLI)

1. Change directory into the newly cloned project.
1. Execute the `create-iam-admin-and-group.sh` script with the following command:
	1. `sh create-iam-admin-and-group.sh`
1. Download the user's permission file from AWS 
2. [Configure AWS CLI Version 2](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html "Configure AWS CLI Version 2")
	3. Set read-only permissions of the key that was generated during step 4. with the following command:
		1. `chmod 400 ~/.aws/<my-key-pair>.pem`

### Configure variables.tfvars

1. Add your IP Address to the variable. To find your IP Address, run the following command:
	1. `curl http://checkip.amazonaws.com/`
2. Add that IP Address to variables.tfvars

### Terraform Create
1. Execute the following command from within the cloned project:
	1. `terraform apply --var-file variables.tfvars`
	2. Check whether the execution plan for the set of changes matches your expectations:
		1. If the planned changes are acceptable, type `yes` on the line given to you

### Ansible Configuration
1. Add the output ip address from the previously executed terraform command to the Ansible Inventory (/etc/ansible/hosts):
```
[ec2]
ec2-user@<host>
```
2. Edit the `DD_API_KEY` in `playbook-nginx-datadog.yaml` with your own
2. Execute the following command from within the cloned project:
	1. `sudo ansible-playbook playbook-nginx-datadog.yaml`
3. Enable sending of EC2 and Nginx metrics and log data

![Screenshot]("Datadog.gif")

## Challenges
1. EC2 and Nginx Logs using CloudFormation automated method

## Q & A
