terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}
provider "aws" {
  region = "us-west-2"
}
resource "aws_ecr_repository" "ecr" {
  name = "catest"
}

#Import Container Image to Elastic Container Registry

resource "null_resource" "image" {
  provisioner "local-exec" {
    command = <<EOF
       $(aws ecr get-login --region us-west-2 --no-include-email)
       docker pull hello-world:latest
       docker tag hello-world:latest ${aws_ecr_repository.ecr.repository_url}
       docker push ${aws_ecr_repository.ecr.repository_url}:latest
   EOF
  }
}
