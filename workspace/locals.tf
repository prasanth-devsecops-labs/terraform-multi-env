locals {
  ami_id = data.aws_ami.devops.id
  env = terraform.workspace
}