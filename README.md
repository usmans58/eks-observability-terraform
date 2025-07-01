
# 🚀 EKS Cluster Deployment with Terraform

This Terraform project provisions a complete **Amazon EKS (Elastic Kubernetes Service)** infrastructure on AWS. It modularly creates the VPC, IAM roles, EKS control plane, and managed node group.

---

## 📁 Project Structure

```
.
├── main.tf                    # Root module that calls all submodules
├── provider.tf                # AWS provider and backend configuration
├── modules/
│   ├── vpc/                   # Creates VPC, subnets, route tables, NAT GW, etc.
│   ├── iam/                   # Manages IAM roles/policies for EKS and node group
│   ├── eks_cluster/           # Provisions the EKS control plane
│   └── node_group/            # Creates EKS managed node group
```

---

## ⚙️ Features

- **Highly Modular**: Clean separation of concerns using modules.
- **VPC Setup**: Public and private subnets, route tables, NAT Gateway.
- **IAM Roles**: Cluster and node group roles with proper policies.
- **EKS Control Plane**: Fully functional EKS cluster with API access.
- **Node Group**: Scalable managed worker nodes.
- **RBAC Setup**: Developer IAM user with limited access to EKS.

---

## 📦 Requirements

- Terraform `>= 1.0`
- AWS CLI configured
- An S3 bucket for remote state (already referenced in `provider.tf`)

---

## 🚨 Required Input Variables

You can define these in a `terraform.tfvars` file or pass them using `-var` flags:

```hcl
vpc_cidr             
cluster_name         = "my-eks-cluster"
availability_zones   = ["us-west-2a", "us-west-2b"]
private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnet_cidrs  = ["10.0.3.0/24", "10.0.4.0/24"]
eks_version          = "1.29"
node_group_desired_size = 2
node_group_min_size     = 1
node_group_max_size     = 3
instance_types          = ["t3.medium"]
```

---

## ✅ Usage

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Review the Execution Plan

```bash
terraform plan
```

### 3. Apply Infrastructure Changes

```bash
terraform apply
```

### 4. Configure `kubectl` Access

```bash
aws eks --region us-west-2 update-kubeconfig --name <your-cluster-name>
```

---

## 🧩 Module Breakdown

### `modules/vpc/`
- Creates a new VPC with DNS support
- 2 public and 2 private subnets across 2 Availability Zones
- Configures Internet Gateway, NAT Gateway, route tables, and subnet associations
- Tags resources for Kubernetes load balancer integrations

### `modules/iam/`
- IAM role for the EKS control plane with `AmazonEKSClusterPolicy`
- IAM role for worker nodes with:
  - `AmazonEKSWorkerNodePolicy`
  - `AmazonEKS_CNI_Policy`
  - `AmazonEC2ContainerRegistryReadOnly`
- IAM user for developers with limited EKS read-only access (`eks:DescribeCluster`, `eks:ListClusters`)
- Grants EKS access to the IAM user using `aws_eks_access_entry`

### `modules/eks_cluster/`
- Provisions the EKS control plane
- Public API endpoint is enabled
- Bootstrap user is granted admin access to the cluster

### `modules/node_group/`
- Deploys a managed node group
- Supports instance type customization and autoscaling settings
- Uses private subnets for security
- Tags and labels the node group

---

## 🛑 Cleanup

To tear down all resources:

```bash
terraform destroy
```

---

## 🔐 Security Considerations

- The EKS API endpoint is public; ensure appropriate access controls and security groups are applied.
- IAM roles should follow the principle of least privilege.
- Use encrypted S3 and DynamoDB (optional) for storing state securely.
- Consider using OIDC for fine-grained access control inside the cluster.

---

## 🧪 Example `terraform.tfvars`

```hcl
vpc_cidr             
cluster_name        
availability_zones   
private_subnet_cidrs 
public_subnet_cidrs  
eks_version          
node_group_desired_size 
node_group_min_size     
node_group_max_size     
instance_types         
```

---

## 📌 Notes

- Default region: `us-west-2`
- Remote state is stored in S3: `eks-cluster-terraform-state-bucket-1/terraform/state`
- `use_lockfile` is enabled in backend for safer state management

---

## 👨‍💻 Author

Terraform Infrastructure-as-Code for EKS deployments — modular, scalable, and production-grade.

---

## 📄 License

This project is licensed under the MIT License.
