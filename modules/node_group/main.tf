resource "aws_eks_node_group" "node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = var.node_group_role_arn
  subnet_ids      = var.subnet_ids
  version         = var.eks_version
  capacity_type   = "ON_DEMAND"

  scaling_config {
    desired_size = var.node_group_desired_size
    max_size     = var.node_group_max_size
    min_size     = var.node_group_min_size
  }

  instance_types = var.instance_types

  tags = {
    Name = "${var.cluster_name}-node-group"
  }

#   depends_on = [
#     module.iam.node_group_role_policy_attachment,
#     aws_eks_cluster.eks_cluster,
#   ]

}