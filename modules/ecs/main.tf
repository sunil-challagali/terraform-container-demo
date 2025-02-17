resource "aws_ecs_cluster" "main" {
  name = var.cluster_name

  tags = {
    Name = "main_cluster"
  }
}

