resource "aws_instance" "webserver" {
ami = "${lookup(var.amis, var.region)}"
count = "${var.instance_count}"
availability_zone = "ap-southeast-1a"
instance_type = "t2.micro"
key_name = "${var.key_name}"
vpc_security_group_ids = ["${aws_security_group.web.id}"]
subnet_id = "${aws_subnet.public-subnet-in-ap-southeast-1.id}"
user_data  = "${file("install_apache.sh")}"
associate_public_ip_address = true
source_dest_check = false

tags {
Name = "Application webserver  -${count.index + 1}"
}
}
