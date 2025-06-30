variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}
variable "availability_zones" {
  description = "List of availability zones for the subnets"
  type        = list(string)
}
variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for the private subnets"
  type        = list(string)
}
variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
}
variable "eks_version" {
  description = "The version of the EKS cluster"
  type        = string
  default     = "1.21"
}
variable "eks_version" {
  description = "The EKS version"
  type        = string
}

variable "node_group_desired_size" {
  description = "The desired size of the EKS node group"
  type        = number
}

variable "node_group_max_size" {
  description = "The maximum size of the EKS node group"
  type        = number
}

variable "node_group_min_size" {
  description = "The minimum size of the EKS node group"
  type        = number
}

variable "instance_types" {
  description = "The instance types for the EKS node group"
  type        = list(string)
}
