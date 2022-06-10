# Using Terraform to Create an Environment

## Getting Started
### Configuring AWS Authentication
- Install AWS CLI
- Configure AWS CLI with IAM user credentials.

### Initializing Terraform
The following will initialize the local terraform configuration without
creating a bucket for storing state data.

```sh
cd terraform
terraform init
```

### Running Terraform

Run the following to ensure ***terraform*** will only perform the expected
actions:

```sh
terraform plan
```

Run the following to apply the configuration to the target AWS
environment:

```sh
terraform apply
```

### Tearing Down the Terraformed Cluster

Run the following to verify that ***terraform*** will only impact the expected
nodes and then tear down the cluster.

```sh
terraform plan
terraform destroy
```