resource "aws_instance" "ec2" {
    ami = "ami-005e54dee72cc1d00"
    instance_type = "t2.micro"
    tags = {
      Name = "sample_sec2"
    }
  
}