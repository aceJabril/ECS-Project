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

resource "aws_security_group" "ecs-alb-sg" {
    name        = "ecs-alb-sg"
    description = "Security group for the ALB"
    vpc_id      = aws_vpc.ecs_project.id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
    }

  tags = {
    Name = "ecs-alb-sg"
  }

}
  
  resource "aws_security_group" "ecs-sg" {
    name = "ecs-sg"
    description = "Security group for the ECS tasks"
    vpc_id = aws_vpc.ecs_project.id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        security_groups = [aws_security_group.ecs-alb-sg.id]
  }

  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

tags = {
    Name = "ecs-sg"
  }
  }