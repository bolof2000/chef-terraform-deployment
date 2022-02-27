
# store state information
terraform {
  backend "s3" {
    bucket = "oracle-intervie-state"
    region = "us-east-1"
    key    = "oracle/remote.state"
  }
}

locals {
  user_data = <<-EOT
  #!/bin/bash
  sudo apt update
  sudo apt-get install nginx -y
  sudo systemctl start nginx
  sudo systemctl enable nginx
  curl -L https://chef.io/chef/install.sh | sudo bash
  EOT
}

resource "aws_launch_configuration" "custom-launch-config" {
  image_id        = var.ami
  instance_type   = var.instance-type
  key_name        = var.key-name
  security_groups = [aws_security_group.custom-instance-sg.id]
  lifecycle {
    create_before_destroy = true
  }
  enable_monitoring = false
  name_prefix = "chefnodes"
  user_data_base64 =  base64encode(local.user_data)

}

# auto scale infrastructure to be managed by chef

resource "aws_autoscaling_group" "asg-chef-nodes" {
  name = "austoscaling-chef-nodes"
  vpc_zone_identifier = [var.subnet-id-01,var.subnet-id-02]

  max_size = var.max_size
  min_size = var.min_size
  desired_capacity = var.desired
  health_check_grace_period = 100
  health_check_type = "ELB"
  load_balancers = [aws_elb.this.name]
  force_delete = true
  tag {
    key                 = "Name"
    propagate_at_launch = false
    value               = "chef-nodes-ec2-instances"
  }
  launch_configuration = aws_launch_configuration.custom-launch-config.name
}
