resource "aws_vpc" "eks_vpc" {
  cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true
  tags = {
    Name = "${var.cluster_name}-vpc"
  }
  
}
resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "${var.cluster_name}-igw"
  }
}

resource "aws_subnet" "eks_private_subnet" {
  count = 2
  vpc_id = aws_vpc.eks_vpc.id
  cidr_block = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "${var.cluster_name}-private-subnet-${count.index + 1}"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}
resource "aws_subnet" "eks_public_subnet" {
  count = 2
  vpc_id = aws_vpc.eks_vpc.id
  map_public_ip_on_launch = true
  cidr_block = var.public_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "${var.cluster_name}-public-subnet-${count.index + 1}"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}