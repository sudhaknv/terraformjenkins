resource "aws_route_table" "routetable1" {
    vpc_id = "${aws_vpc.cloudvpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }
    tags = {
      "Name" = "routetable1"
    }
  
}
resource "aws_route_table_association" "publicsubnet1" {
    subnet_id = "${aws_subnet.publicsubnet1.id}"
    route_table_id = "${aws_route_table.routetable1.id}"
  
}
resource "aws_route_table_association" "publicsubnet2" {
    subnet_id = "${aws_subnet.publicsubnet2.id}"
    route_table_id = "${aws_route_table.routetable1.id}"
  
}