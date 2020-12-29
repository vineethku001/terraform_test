resource "aws_eip" "web-1" {
instance = "${aws_instance.web-1.id}"
vpc = true
}