resource "aws_instance" "ec2" {
    ami = "ami-0989fb15ce71ba39e"
    instance_type = "t2.micro"
    tags = {
      Name = "sample_sec2"
      Env  = "test"
    }
  
}
