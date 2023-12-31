resource "aws_docdb_cluster" "docdb" {
  cluster_identifier        = "roboshop-${var.ENV}-docdb"
  engine                    = "docdb"
  master_username           = local.DOCDB_USER
  master_password           = local.DOCDB_PASS
  skip_final_snapshot       = true 
  vpc_security_group_ids    = [aws_security_group.allows_docbd.id]
  db_subnet_group_name      = aws_docdb_subnet_group.aws_docdb_subnet_group.name


#   backup_retention_period   = 14
#   preferred_backup_window   = "02:00-05:00"
}

# Creates subnet group

resource "aws_docdb_subnet_group" "aws_docdb_subnet_group" {
  name       = "roboshop-docdb-${var.ENV}-subnetgroup"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS

  tags = {
    Name = "roboshop-docdb-${var.ENV}-subnetgroup"
  }
}

# Creates compute machines needed for Documnet DB and these has to be attached to the cluster
resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "roboshop-docdb-${var.ENV}-instance"
  cluster_identifier = aws_docdb_cluster.docdb.id       # This argumnet attaches the nodes created here to the docdb cluster
  instance_class     = var.DOCDB_INSTANCE_TYPE

  depends_on         = [aws_docdb_cluster.docdb]
}