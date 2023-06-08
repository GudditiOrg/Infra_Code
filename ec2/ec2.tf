resource "aws_instance" "ec2" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    tags = {
      Name = "sample_sec2"
      Env  = "test"
    }
  
}
