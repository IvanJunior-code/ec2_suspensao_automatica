output "connection" {
  value = "ssh -i ~/.ssh/${aws_key_pair.key_pair.key_name} ubuntu@.compute-1.amazonaws.com"
}

output "instance_ips" {
  value     = join("\n", [for ip in data.aws_instances.ec2.public_ips : replace(ip, ".", "-")])
  sensitive = false
}

