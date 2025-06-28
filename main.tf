module "vpc" {
    source = "./modules/vpc"
    
    vpc_cidr             = var.vpc_cidr
    cluster_name         = var.cluster_name
    availability_zones   = var.availability_zones
    private_subnet_cidrs = var.private_subnet_cidrs
    public_subnet_cidrs  = var.public_subnet_cidrs
}