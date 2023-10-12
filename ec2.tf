resource "aws_key_pair" "project" {
  key_name   = "project-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
#depend_on from RDS"
resource "aws_instance" "instance" {
 
  ami          = data.aws_ami.ubuntu.id
  instance_type = var.ec2_type
  subnet_id = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.sg-group1.id]
  key_name = aws_key_pair.project.key_name
  user_data = file("wordpress.sh")

  tags = {
    Name = var.common_tags} 


 
}



 output ec2{
  value =aws_instance.instance.public_ip
 }

# output "DatabaseUserName" {
# value = aws_db_instance.database.username
# description = "The Database Name!"
# }
# output "DBConnectionString" {
# value = aws_db_instance.database.endpoint
# }

