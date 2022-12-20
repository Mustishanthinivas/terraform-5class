resource "aws_instance" "public-servers" {
  count                       = 3
  ami                         = var.imagename
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.public-subnets.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "${var.vpc_name}-publicserver-${count.index + 1}"
    Env        = "Prod"
    Owner      = "Sree"
    CostCenter = "ABCD"
  }
  lifecycle {
    create_before_destroy = true
  }

}
resource "aws_instance" "private-server" {
  count                       = 3
  ami                         = var.imagename
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.private-subnets.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "${var.vpc_name}-privatecserver-${count.index + 1}"
    Env        = "Prod"
    Owner      = "Sree"
    CostCenter = "ABCD"
  }
}
