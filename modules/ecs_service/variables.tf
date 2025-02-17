variable "cluster_id" {
  description = "The ID of the ECS cluster"
  type        = string
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "task_family" {
  description = "The family of the ECS task"
  type        = string
}

variable "container_definitions" {
  description = "The container definitions in JSON format"
  type        = string
}

variable "cpu" {
  description = "The amount of CPU units used by the task"
  type        = string
}

variable "memory" {
  description = "The amount of memory (in MiB) used by the task"
  type        = string
}

variable "execution_role_arn" {
  description = "The ARN of the execution role"
  type        = string
}

variable "task_role_arn" {
  description = "The ARN of the task role"
  type        = string
}

variable "desired_count" {
  description = "The desired number of tasks"
  type        = number
}

variable "subnets" {
  description = "The list of subnet IDs for the ECS service"
  type        = list(string)
}

variable "security_groups" {
  description = "The list of security group IDs for the ECS service"
  type        = list(string)
}

variable "target_group_arn" {
  description = "The ARN of the target group"
  type        = string
}

variable "container_name" {
  description = "The name of the container"
  type        = string
}

variable "container_port" {
  description = "The port on which the container is listening"
  type        = number
}

