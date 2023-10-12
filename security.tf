resource "aws_security_group" "sg-group1" {
  name        = var.sg_group
  description = "Allow TLS inbound traffic"
  
  vpc_id = aws_vpc.group1.id
  

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.default_cidr_block]
    
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.default_cidr_block]
    
  }
  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.default_cidr_block]
   
  }

  tags = {
    Name = var.common_tags}
}


resource "aws_security_group" "db_security_group" {
  name        = "for_sql"
  description = "Allow TLS inbound traffic"
   vpc_id = aws_vpc.group1.id
  

  ingress {
    description      = "TLS from VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = [var.default_cidr_block]
    
  }



  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.default_cidr_block]
   
  }
}


