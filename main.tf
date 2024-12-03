provider "aws" {
  region = var.region
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

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}

resource "aws_db_instance" "postgres-db-instance" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "16"
  identifier           = "postgres-db-instance"
  instance_class       = "db.t4g.micro"
  password             = aws_secretsmanager_secret_version.db_password.secret_string
  skip_final_snapshot  = true
  storage_encrypted    = false
  publicly_accessible  = true
  username             = aws_secretsmanager_secret_version.db_user.secret_string
  apply_immediately    = true
  db_name              = "database_fastfood"
  parameter_group_name = aws_db_parameter_group.pg_parameter_group.name
}

resource "aws_db_instance" "postgres-db-payment-api" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "16"
  identifier           = "postgres-db-payment-api"
  instance_class       = "db.t4g.micro"
  password             = aws_secretsmanager_secret_version.db_payment_api_password.secret_string
  skip_final_snapshot  = true
  storage_encrypted    = false
  publicly_accessible  = true
  username             = aws_secretsmanager_secret_version.db_payment_api_user.secret_string
  apply_immediately    = true
  db_name              = "database_fastfood"
  parameter_group_name = aws_db_parameter_group.pg_parameter_group.name
}

resource "aws_db_parameter_group" "pg_parameter_group" {
  name   = "pg-instances"
  family = "postgres16"

  parameter {
    name  = "rds.force_ssl"
    value = "0"
  }

  lifecycle {
    create_before_destroy = true
  }
}