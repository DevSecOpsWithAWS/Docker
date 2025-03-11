resource "aws_instance" "Docker" {
  ami                    = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id     = "subnet-06537747f3b689663"
  instance_type          = "t2.micro"
  associate_public_ip_address = true 
  tags = {
    Name    = "Docker-demo"
    Purpose = "Docker practice"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}