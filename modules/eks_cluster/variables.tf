variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}
variable "eks_version" {
  description = "The version of the EKS cluster"
  type        = string
}
variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)

}
variable "eks_cluster_role_arn" {
  description = "The ARN of the EKS cluster role"
  type        = string

}