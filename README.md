# Amazon AWS MINIKUBE
## Running single-node Kubernetes cluster on AWS

For some tests that require a full version of Kubernetes with external access (hard to achieve with Kind or Microk8s) it is often easier to use a single instance of AWS with minikube.  
This Terraform configuration creates an instance on AWS and installs minikube on it.

## Features

* There's no need for AWS load balancer - minikube provides [metallb](https://metallb.universe.tf/) which is configured to use instance's public IP address (single `LoadBalancer` can be configured at the moment and it is used by nginx ingress controller).
* Storage is provisioned automatically using EBS volumes and `gp2` StorageClass is configured as default. You can use `standard` StorageClass which uses local volumes, but for some workloads it doesn't work (all directories have 777 perms).


This configuration uses my own module from [Terraform Module Registry](https://github.com/ferluko/terraform-aws-minikube).

<!-- TOC -->

- [Amazon AWS Minikube](#amazon-aws-minikube)
    - [Prerequisites and dependencies](#prerequisites-and-dependencies)
    - [Configuration](#configuration)
    - [Creating](#creating)
    - [Deleting](#deleting)

<!-- /TOC -->

## Prerequisites and dependencies

TBC

## Configuration

| Name                 | Description                               | Type     | Default       | Required |
| -------------------- | ----------------------------------------- | -------- | ------------- | :------: |
| env\_name            | String used as a prefix for AWS resources | `string` | n/a           |   yes    |
| instance\_disk\_size | Instance disk size (in GB)                | `number` | `50`          |    no    |
| instance\_type       | Instance type                             | `string` | `"t3a.large"` |    no    |
| subnet\_id           | ID of the AWS subnet                      | `string` | n/a           |   yes    |
| vpc\_id              | ID of the AWS VPC                         | `string` | n/a           |   yes    |

## Creating

To create the VPC, 
* Export AWS credentials into environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
* Apply Terraform configuration:

## Outputs

| Name              | Description                                |
| ----------------- | ------------------------------------------ |
| kubeconfig        | Kubeconfig content                         |
| public\_dns       | Public DNS name of the instance            |
| public\_ip        | Public IP name of the instance             |
| ssh\_private\_key | SSH private key generated for the instance |

## Deleting

To delete, 
* Export AWS credentials into environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
* Destroy Terraform configuration:
```bash
terraform destroy --var-file example.tfvars
```
#   a w s - m i n i k u b e  
 