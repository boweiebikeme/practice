output "elb_dns" {
  value = aws_lb.main.dns_name
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}