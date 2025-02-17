variable "cluster_id" {
  description = "The ID of the ECS cluster"
  type        = string
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "task_definition" {
  description = "The ECS task definition family"
  type        = string
}

variable "container_name" {
  description = "The name of the container"
  type        = string
}

variable "container_port" {
  description = "The port that the container listens on"
  type        = number
}

variable "image_url" {
  description = "The URL of the container image in ECR"
  type        = string
}

variable "desired_count" {
  description = "The number of tasks to run"
  type        = number
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the subnets"
  type        = list(string)
}

variable "security_group_ids" {
  description = "The IDs of the security groups"
  type        = list(string)
}

variable "execution_role_arn" {
  description = "The ARN of the execution role"
  type        = string
}

variable "task_role_arn" {
  description = "The ARN of the task role"
  type        = string
}

