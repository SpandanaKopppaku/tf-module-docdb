resource "aws_docdb_cluster" "docdb" {
  cluster_identifier        = "roboshop-${var-env}-docdb"
  engine                    = "docdb"
  master_username           = "admin1"
  master_password           = "roboshop1"
  skip_final_snapshot       = true 
  vpc_security_group_ids    = ? 
  db_subnet_group_name      = ? 

#   backup_retention_period   = 14
#   preferred_backup_window   = "02:00-05:00"
}

# Creates subnet group

resource "aws_docdb_subnet_group" "docdb" {
  name       = "main"
  subnet_ids = [aws_subnet.frontend.id, aws_subnet.backend.id]

  tags = {
    Name = "My docdb subnet group"
  }
}
