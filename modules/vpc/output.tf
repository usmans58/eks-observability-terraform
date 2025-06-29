output "eks_private_subnet_ids" {
  description = "List of private subnet IDs for the EKS cluster"
  value       = aws_subnet.eks_private_subnet[*].id

}