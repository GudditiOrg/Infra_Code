resource "aws_vpc" "VPC" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"

    tags = {
      Name = var.TagName
    }
     
}

resource "aws_subnet" "PubSubnet" {
    vpc_id = aws_vpc.VPC.id
    cidr_block = "10.0.1.0/24"
    tags = {
      Name = var.TagName
    }
  
}

resource "aws_internet_gateway" "MYIGW" {
    vpc_id = aws_vpc.VPC.id
    tags = {
      Name = var.TagName
    }
  
}
#Public Route
resource "aws_route_table" "My_RTB" {
    vpc_id = aws_vpc.VPC.id

}


#Public Route
resource "aws_route" "My_RTB_Association" {
    route_table_id = aws_route_table.My_RTB.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.MYIGW.id

}


