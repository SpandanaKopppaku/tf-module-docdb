resource "aws_security_group" "allows_docbd" {
  name        = "allows_docdb_internal only"
  description = "allows_docdb_internal only"

  ingress {
    description = "docdb from VPC"
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = [ata.terraform_remote_state.vpc.VPC_CIDR]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "roboshop-${var.ENV}-docdb-sg"
  }
}