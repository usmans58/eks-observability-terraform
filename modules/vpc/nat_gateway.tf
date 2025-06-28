resource "aws_eip" "nat_ip" {
    domain = "vpc"
    tags = {
      Name = "${var.cluster_name}-nat-eip"
    }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id    = aws_subnet.eks_public_subnet[0].id
    
  tags = {
    Name = "${var.cluster_name}-nat-gateway"
  }
  depends_on = [ aws_internet_gateway.eks_igw ]
}