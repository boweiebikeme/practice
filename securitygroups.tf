resource "aws_security_group" "web_sg" {
  name        = "web-server-sg"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Custom Port"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.pub_main.id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  user_data = <<-EOF
              #!/bin/bash
              mkdir -p /var/www/html
              echo "Hello, World 1" > /var/www/html/index.html
              cd /var/www/html
              nohup python3 -m http.server 80 --bind 0.0.0.0 > /var/log/http-server.log 2>&1 &
              EOF

  tags = {
    Name = "terraform-nginx-server"
  }
}


# resource "aws_instance" "web_servers" {
#   ami                         = data.aws_ami.ubuntu.id
#   instance_type               = "t2.micro"
#   subnet_id                   = aws_subnet.pub_main.id
#   associate_public_ip_address = true

#   vpc_security_group_ids = [
#     aws_security_group.web_sg.id
#   ]

#   user_data = <<-EOF
#               #!/bin/bash
#               mkdir -p /var/www/html
#               echo "Hello, World 2" > /var/www/html/index.html
#               cd /var/www/html
#               nohup python3 -m http.server 80 --bind 0.0.0.0 > /var/log/http-server.log 2>&1 &
#               EOF

#   tags = {
#     Name = "terraform-nginx-server"
#   }
# }