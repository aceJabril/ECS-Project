module "vpc" {
  source                      = "./modules/vpc"
  cidr_block                  = var.cidr_block
  subnet_cidr_block_1         = var.subnet_cidr_block_1
  subnet_cidr_block_2         = var.subnet_cidr_block_2
  az_1                        = var.az_1
  az_2                        = var.az_2
  private_subnet_cidr_block_1 = var.private_subnet_cidr_block_1
  private_subnet_cidr_block_2 = var.private_subnet_cidr_block_2
}

module "iam" {
  source = "./modules/iam"
}

module "ecr" {
  source = "./modules/ecr"
}

module "acm" {
  source = "./modules/acm"
  domain = var.domain
}

module "alb" {
  source          = "./modules/alb"
  vpc_id          = module.vpc.vpc_id
  subnet_id_1     = module.vpc.subnet_1_id
  subnet_id_2     = module.vpc.subnet_2_id
  ecs_alb_sg      = module.vpc.alb_sg_id
  certificate_arn = module.acm.certificate_arn
}

module "ecs" {
  source             = "./modules/ecs"
  execution_role_arn = module.iam.arn_output
  ecr_image_url      = "${module.ecr.ecr_repo_url}:latest"
  subnet_id_1        = module.vpc.private_subnet_1_id
  subnet_id_2        = module.vpc.private_subnet_2_id
  ecs_service_sg     = module.vpc.ecs_sg_id
  target_group_arn   = module.alb.target_group_arn
  depends_on         = [module.alb, module.vpc]
  cpu                = "256"
  memory             = "512"
}