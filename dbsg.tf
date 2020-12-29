resource "aws_security_group" "db" {
name = "vpc_db"
description = "Accept incoming database connections."

ingress {
from_port = 3306
to_port = 3306
protocol = "tcp"
security_groups = ["${aws_security_group.web.id}"]
}

ingress {
from_port = -1
to_port = -1
protocol = "icmp"
cidr_blocks = ["${var.vpc_cidr}"]
}


vpc_id = "${aws_vpc.default.id}"

tags {
Name = "DBServerSG"
}
}
