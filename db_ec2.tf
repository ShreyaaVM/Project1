resource "aws_instance" "private_instance" {
  ami           = "ami-009e46eef82e25fef"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
  key_name      = "ABCD"

  tags = {
    Name = "db_server"
  }

  security_groups = [aws_security_group.db_node.id]
  user_data       = file("sample.sh")
}


