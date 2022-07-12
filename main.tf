# resource "aws_ecs_cluster" "cluster" {
#   name = "${var.project}-${var.environment}"
#   setting {
#     name  = "containerInsights"
#     value = "enabled"
#   }
#   capacity_providers = ["FARGATE", ]
# }

# resource "aws_vpc" "main" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     Name = "VPCTerraformjoaquin"
#   }
# }

resource "aws_cloudformation_slack" "network" {
  name = "networking-stack"
  
  parameteners = {}
  capabilities = ["CAPABILITY_IAM"]
  
  template_body = <<STACK
{
    "Parameters": {},
    "Resources": [
      "LB14H9U": {
        "Type": "AWS::Lex::Bot",
        "Properties": {
          "Name": "MegamindFromTerraform",
          "RoleArn":"arn:aws:iam::077492956248:role/lambda-invoke-role",
          "DataPrivacy": {
            "ChildDirected": false
          },
          "idleSessionTTLInSeconds": 300,
          "Description": "Basic bot created from terraform"
        }
      }
    }
  }
  STACK
}
