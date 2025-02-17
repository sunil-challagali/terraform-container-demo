resource "aws_ecs_cluster" "this" {
  name = var.cluster_name

  tags = {
    Name = var.cluster_name
  }
}

output "cluster_id" {
  value = aws_ecs_cluster.this.id
}
