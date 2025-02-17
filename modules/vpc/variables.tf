variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr1" {
  description = "The CIDR block for subnet 1"
  type        = string
}

variable "subnet_cidr2" {
  description = "The CIDR block for subnet 2"
  type        = string
}

variable "availability_zone1" {
  description = "The availability zone for subnet 1"
  type        = string
}

variable "availability_zone2" {
  description = "The availability zone for subnet 2"
  type        = string
}

