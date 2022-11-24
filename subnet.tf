resource "aws_subnet" "publicsubnet1" {
    vpc_id = "${aws_vpc.cloudvpc.id}"
    cidr_block = "10.10.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-2a" 
    tags = {
      "Name" = "PublicSubnet1"
    }
}
resource "aws_subnet" "publicsubnet2" {
    vpc_id = "${aws_vpc.cloudvpc.id}"
    cidr_block = "10.10.2.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-2b" 
    tags = {
      "Name" = "PublicSubnet2"
    }
}
