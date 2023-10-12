
# resource "aws_db_instance" "database" {
#  allocated_storage    = 20
#  storage_type         = "gp2"
#  engine               = "mysql"
#  identifier           = "rdsgroup1"
#  engine_version       = "5.7"
#  instance_class       = "db.t2.micro"
#  username             = "Venera"
#  password             = "kaizen123"
#  skip_final_snapshot  = true
#  db_subnet_group_name   = aws_db_subnet_group.db_sg.name
#  vpc_security_group_ids = [aws_security_group.db_security_group.id]
 
# }
 
 #endpoint
