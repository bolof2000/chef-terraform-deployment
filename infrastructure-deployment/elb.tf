
# AWS ELB config for the nodes to manage with Chef

resource "aws_security_group" "custom-elb-sg" {
  vpc_id             =var.vpc_id
  description = "security groups for the load balancer"
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "elb-sg"
  }
}

resource "aws_elb" "this" {
  name = "chef-nodes-elb"
  subnets            = [var.subnet-id-01,var.subnet-id-02]
  security_groups = [aws_security_group.custom-elb-sg.id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  tags = {
    Name = "customer-elb-for-chef-nodes"
  }

}



resource "aws_security_group" "custom-instance-sg" {
  vpc_id             = var.vpc_id
  description = "sec groups for nodes"
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "instance-sg"
  }


}
