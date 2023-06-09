
resource "aws_security_group" "web_sg" {
  name        = "web_security_group"
  description = "Allow incoming traffic on port 80"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "ec2" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.web_sg.name]
    user_data = <<-EOF
      #!/bin/bash
      sudo apt update 
      sudo apt install -y apache2
      sudo service apache2 start
    EOF
    tags = {
      Name = "sample_sec2"
      Env  = "test"
    }
  
}
output "ec2-public-ip" {
  value = aws_instance.ec2.public_dns
  
}
