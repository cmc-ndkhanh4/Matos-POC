# Ansible
## Remediation use case problem statement
- Remediation resource: AWS EKS, AWS CLI
- Resource metadata / parameter / factor: cluster kms enabled

## Why remediation? - reference to standards and compliance
- EKS supports using AWS KMS keys to provide envelope encryption of Kubernetes secrets stored in EKS. Implementing envelope encryption is considered a security best practice for applications that store sensitive data and is part of a defense in depth security strategy.

## Remediation or solution steps
### Roles and Permissions required for the IAM user to execute the remediation.
**Prerequisite**:
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1654770869947",
      "Action": "eks:*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "Stmt1654772674550",
      "Action": "ec2:*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "Stmt1654774251593",
      "Action": "kms:*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
```
### Enable API (if any)
**Step 1**:
- Install AWS CLI.
- Setup CLI with the user has EKS role above.

**Step 2**:
- Run this command:
```
aws eks associate-encryption-config --region <cluster-region> --name <cluster-name> --encryption-config '[{\"resources\":[\"secrets\"],\"provider\":{\"keyArn\":\"arn:aws:kms:<cluster-region>:<account>:key/<key>\"}}]'
```

## Reference to the backlog / use-case id in spreadsheet
- use case 2
## How to setup the infrastructure for testing?
- Please read Terraform README.
## How to run the script? or How to execute the command?
**Prerequisite**:
- Install Matos, please read installation here: https://github.com/cloudmatos/Matos
- Install ansible.

**Step 1**:
```
cd ansbile
```
**Step 2**:
```
ansible-playbook playbook.yml
```
## Add file/folder details - names and purpose.
File structure
```
ansible
    ├── playbook.yml
    ├── README.MD
    └── variables.yml
```
- playbook.yml contain defined task to run
- variables.yml contains some value and will be used in playbook.yml
- README.MD take note on how to run a playbook.
## Details about the variables/parameters used
In the variables.yml:
```
FLASK_RUN_PORT: Port run local Matos server.
FLASK_APP: Entrypoint of Matos server.
REPO_DEST: Destinition of Matos project.
EKS_REGION: Region placed EKS cluster using when logging cluster is not enabled.
EKS_CLUSTER_NAME: Cluster name using when logging cluster is not enabled.
ACCOUNT_ID: Account ID of IAM User
KMS_KEY: KMS key name create by IAM user
```
## Any relevant reference can be added to the readme.md
- NA