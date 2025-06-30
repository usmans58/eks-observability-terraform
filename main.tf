module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  cluster_name         = var.cluster_name
  availability_zones   = var.availability_zones
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
}
module "iam" {
  source = "./modules/iam"

  cluster_name = var.cluster_name
}
module "eks" {
  source               = "./modules/eks_cluster"
  cluster_name         = var.cluster_name
  eks_version          = var.eks_version
  subnet_ids           = module.vpc.eks_private_subnet_ids
  eks_cluster_role_arn = module.iam.eks_cluster_role_arn


  depends_on = [module.iam]

}
module "node_group" {
  source                  = "./modules/node_group"
  cluster_name            = var.cluster_name
  eks_version             = var.eks_version
  subnet_ids              = module.vpc.eks_private_subnet_ids
  node_group_role_arn     = module.iam.node_group_role_arn
  node_group_desired_size = var.node_group_desired_size
  node_group_max_size     = var.node_group_max_size
  node_group_min_size     = var.node_group_min_size
  instance_types          = var.instance_types

  depends_on = [module.iam, module.eks]
}