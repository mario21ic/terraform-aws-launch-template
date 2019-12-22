data "aws_ami" "backend" {
  most_recent = true
  owners = ["self"]

  filter {
    name   = "name"
    values = ["${var.ami_name}"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
