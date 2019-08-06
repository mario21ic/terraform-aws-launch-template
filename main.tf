resource "aws_launch_template" "def" {
  name = "${var.env}-lt-${var.name}"

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_type = "standard"
      volume_size = "${var.volume_size}"
    }
  }

  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_termination = false

  ebs_optimized = false 

//  elastic_gpu_specifications {
//    type = "test"
//  }

  iam_instance_profile {
    name = "${var.iam_role}"
  }

  image_id = "${data.aws_ami.backend.id}"
//  image_id = "ami-a0cfeed8"

  instance_initiated_shutdown_behavior = "terminate"

//  instance_market_options {
//    market_type = "spot"
//  }

  instance_type = "${var.instance_type}"

//  kernel_id = "test"

  key_name = "${var.key_name}"

  monitoring {
    enabled = true
  }

//  network_interfaces {
//    associate_public_ip_address = true
//  }

//  placement {
//    availability_zone = "us-west-2a"
//  }

//  ram_disk_id = "test"

  vpc_security_group_ids = ["${var.security_group_ids}"]

//  tag_specifications {
//    resource_type = "instance"
//    tags {
//      Name = "test"
//    }
//  }
  user_data = "${base64encode(var.user_data)}"
}

//module "gw_eni_1" {
//  source = "git::ssh://git@code.yarkan.com:7999/tm/aws-network-interface.git"
//
//  region       = "${var.region}"
//  env          = "${terraform.workspace}"
//  name         = "eni1"
//  private_ip   = "${var.gw_ip_eth1}"
//  ec2_id       = "${module.gw_ec2.ec2_id}"
//  device_index = 1
//
//  subnet_id          = "${local.subnet_public_1_id}"
//  security_group_ids = "${list(data.consul_keys.sg_gateway_id.var.sg_gateway_id)}"
//}
