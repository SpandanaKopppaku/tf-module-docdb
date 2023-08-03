resource "aws_docdb_cluster" "docdb" {
  cluster_identifier        = "roboshop-${var-env}-docdb"
  engine                    = "docdb"
  master_username           = "admin1"
  master_password           = "roboshop1"
  skip_final_snapshot       = true  
}