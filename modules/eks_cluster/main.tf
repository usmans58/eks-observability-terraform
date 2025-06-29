resource "aws_eks_cluster" "eks_cluster" {
  name        = var.cluster_name
  version     = var.eks_version
  role_arn    = module.iam.eks_cluster_role_arn

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true
    subnet_ids              = var.subnet_ids
  }
  access_config {
    authentication_mode = "API"
    bootstrap_cluster_creator_admin_permissions = true
    
  }

  depends_on = [
    module.iam.eks_cluster_role_policy_attachment.eks_cluster_policy,
  ]

}