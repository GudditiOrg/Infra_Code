resource "aws_instance" "ec2" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    user_data = <<EOF
    #!/bin/bash
    sudo apt update 
    sudo apt install -y apache2
    sudo service apache2 start
    >>
    tags = {
      Name = "sample_sec2"
      Env  = "test"
    }
  
}
output "ec2-public-ip" {
  value = aws_instance.ec2.public_dns
  
}
