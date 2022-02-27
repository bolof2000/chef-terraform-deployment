output "elb-name" {
  value = aws_autoscaling_group.asg-chef-nodes.name
}
output "ip" {
  value = aws_elb.this.dns_name
}
