resource "aws_vpc" "cloudvpc" {
    cidr_block = "10.10.0.0/16"
    enable_dns_hostnames = true
    tags = {
       Name = "value_vpc" 
    }
    
  
}
resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.cloudvpc.id}"
    tags = {
      "Name" = "cloud_igw"
    }
  
}
