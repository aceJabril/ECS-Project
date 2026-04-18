resource "aws_vpc" "ecs_project" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "ecs_project_vpc"
  }
}

resource "aws_subnet" "ecs_project_subnet_1" {
  vpc_id                  = aws_vpc.ecs_project.id
  cidr_block              = var.subnet_cidr_block_1
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name = "ecs_project_subnet_1"
  }

}

resource "aws_subnet" "ecs_project_subnet_2" {
  vpc_id                  = aws_vpc.ecs_project.id
  cidr_block              = var.subnet_cidr_block_2
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = true

  tags = {
    Name = "ecs_project_subnet_2"
  }
}

resource "aws_internet_gateway" "ecs_project_igw" {
  vpc_id = aws_vpc.ecs_project.id

  tags = {
    Name = "ecs_project_igw"
  }
}

resource "aws_route_table" "ecs_project_route_table" {
  vpc_id = aws_vpc.ecs_project.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ecs_project_igw.id
  }

  tags = {
    Name = "ecs_project_route_table"
  }
}

resource "aws_route_table_association" "ecs_project_subnet_1_association" {
    subnet_id      = aws_subnet.ecs_project_subnet_1.id
    route_table_id = aws_route_table.ecs_project_route_table.id
  }

resource "aws_route_table_association" "ecs_project_subnet_2_association" {
    subnet_id      = aws_subnet.ecs_project_subnet_2.id
    route_table_id = aws_route_table.ecs_project_route_table.id
  
}