variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string

}

variable "subnet_ids" {
  description = "The subnet IDs to launch the EKS node group"
  type        = list(string)
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
variable "node_group_role_arn" {
  description = "The ARN of the EKS node group role"
  type        = string
}
