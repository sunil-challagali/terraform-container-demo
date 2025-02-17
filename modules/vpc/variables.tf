variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "The availability zones for the subnets"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}
