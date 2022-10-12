output "ssh_private_key" {
  description = "SSH private key generated for the instance"
  value       = "${module.minikube.ssh_private_key}"
}

output "public_ip" {
  description = "Public IP name of the instance"
  value       = "${module.minikube.public_ip}"
}

output "public_dns" {
  description = "Public DNS name of the instance"
  value       = "${module.minikube.public_dns}"
}

output "kubeconfig" {
  description = "Kubeconfig content"
  value       = "${module.minikube.kubeconfig}"
}

output "kubernetes_config" {
  description = "Object with values prepared for the kubernetes provider config."
  value       = "${module.minikube.kubernetes_config}"
}
