resource "aws_eks_node_group" "node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = var.node_group_role_arn
  subnet_ids      = var.subnet_ids
  version         = var.eks_version
  capacity_type   = "ON_DEMAND"
  instance_types  = var.instance_types

  scaling_config {
    desired_size = var.node_group_desired_size
    max_size     = var.node_group_max_size
    min_size     = var.node_group_min_size
  }

  update_config {
    max_unavailable = 1
  }
  labels = {
    role = "node-group"
  }

  tags = {
    Name = "${var.cluster_name}-node-group"
  }

  lifecycle {
    ignore_changes = [
      scaling_config[0].desired_size
    ]
  }

}