terraform {
  required_version = "~> 0.13.2"
  backend "http" {}
}

module "minikube" {
  source = "github.com/ferluko/terraform-aws-minikube"

  aws_region = "${var.aws_region}"
  vpc_id = "${var.vpc_id}"
  subnet_id = "${var.subnet_id}"
  env_name = "${var.env_name}"
  instance_type = "${var.instance_type}"
  instance_disk_size = "${var.instance_disk_size}"
}
