provider "aws" {
  region = "ap-south-1"
}
terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-sunil7756"
    key    = "terraform-container/terraform.tfstate"
    region = "ap-south-1"
  }
}
module "vpc" {
  source      = "./modules/vpc"
  vpc_name    = "my-app-vpc"
  cidr_block  = "10.0.0.0/16"
}

module "security_group" {
  source        = "./modules/security_groups"
  vpc_id        = module.vpc.vpc_id
  sg_name       = "my-app-sg"
  ingress_rules = [{ from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }]
}

module "ecr" {
  source          = "./modules/ecr"
  repository_name = "my-app"
}

module "ecs_cluster" {
  source       = "./modules/ecs-cluster"
  cluster_name = "my-app-cluster"
}

module "ecs_service" {
  source             = "./modules/ecs_service"
  cluster_id         = module.ecs_cluster.cluster_id
  service_name       = "my-app-service"
  task_definition    = "my-app-task"
  container_name     = "my-app-container"
  container_port     = 80
  image_url          = module.ecr.repository_url
  desired_count      = 1
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.subnet_ids
  security_group_ids = [module.security_group.sg_id]
}

module "alb" {
  source          = "./modules/alb"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.subnet_ids
  security_group_id = module.security_group.sg_id
  alb_name        = "my-app-alb"
}

module "iam" {
  source            = "./modules/iam"
  execution_role_name = "ecsExecutionRole"
  task_role_name      = "ecsTaskRole"
}

output "alb_dns_name" {
  value = module.alb.dns_name
}

