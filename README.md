# eks-observability-terraform

## 📌 Overview

`eks-observability-terraform` is an end-to-end Terraform-based project to provision a secure, scalable, and observable Amazon EKS (Elastic Kubernetes Service) cluster. The infrastructure is built with production-grade best practices and is easily extendable with Prometheus and Grafana for monitoring and alerting.

---

## 🚀 Features

- 📦 EKS cluster with managed node groups
- 🌐 Custom VPC with public/private subnets across AZs
- 🔐 Secure IAM roles for EKS and worker nodes
- 📡 Public cluster endpoint with IRSA enabled
- 📊 Ready for observability with Prometheus and Grafana (coming soon)
- ⚙️ Modular architecture

---

## 🛠️ Technologies Used

- Terraform 
- AWS EKS
- AWS VPC, IAM
- Helm (for monitoring setup later)
- Kubernetes

---

---

## 📋 Prerequisites

- AWS CLI configured with proper credentials
- Terraform installed (v1.6+)
- kubectl installed
- Helm installed (for monitoring setup later)

---

## 📦 Getting Started

1. Clone the repo:
   
   git clone //github.com/usmans58/eks-observability-terraform.git
   cd terraform-3tier-infrastructure

2.	Initialize Terraform:
    ```bash
    terraform init

3. Review the execution plan:
    ```bash
    terraform plan

4. Apply the infrastructure:
    ```bash
    terraform apply


This will create real AWS infrastructure. Make sure your AWS account allows this.


🔑 Access the EKS Cluster

After terraform apply, configure kubectl:
    ```bash
    aws eks update-kubeconfig --region <your-region> --name <cluster-name>
    kubectl get nodes

📊 Monitoring Setup (Coming Soon)

Once the EKS cluster is up:
	•	You’ll install Prometheus, Grafana using Helm.
	•	You’ll expose dashboards and set up alert rules.
	•	(Stay tuned for the next module!)

⸻

📤 Outputs

Useful outputs after deployment:
	•	EKS cluster name
	•	EKS endpoint
	•	Node group info
	•	kubeconfig content
