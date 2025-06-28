resource "aws_route_table" "private" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "${var.cluster_name}-private-route-table"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  tags = {
    Name = "${var.cluster_name}-public-route-table"
  }
}

resource "aws_route_table_association" "private" {
  count = length(aws_subnet.eks_private_subnet)

  subnet_id      = aws_subnet.eks_private_subnet[count.index].id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "public" {
  count = length(aws_subnet.eks_public_subnet)

  subnet_id      = aws_subnet.eks_public_subnet[count.index].id
  route_table_id = aws_route_table.public.id
}