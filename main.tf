# resource "aws_ecs_cluster" "cluster" {
#   name = "${var.project}-${var.environment}"
#   setting {
#     name  = "containerInsights"
#     value = "enabled"
#   }
#   capacity_providers = ["FARGATE", ]
# }
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "VPCTerraformjoaquin"
  }
}
