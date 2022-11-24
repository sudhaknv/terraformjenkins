provider "aws" {
  
  region     = "us-east-1"
  alias = "env"
}


resource "aws_instance" "jenkins" {
  ami             = "ami-08d616b7fbe4bb9d0"
  instance_type   = "t2.micro"
    key_name = "aws-keypair"
    subnet_id = "${aws_subnet.publicsubnet1.id}"
    vpc_security_group_ids = ["${aws_security_group.securitygroup.id}"]
    associate_public_ip_address = true	
    tags = {
        Name = "jenkins3"
    }
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y ",
      "sudo yum install java-11-openjdk-devel -y",
      "sudo yum -y install wget",
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",
      "sudo yum upgrade -y",
      "sudo yum install jenkins -y",
      "sudo systemctl daemon-reload",  
      "sudo systemctl start jenkins",
    ]
  }
connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("C:\\Users\\Sudhakar\\Downloads\\aws-keypair.pem")
  }
  }
