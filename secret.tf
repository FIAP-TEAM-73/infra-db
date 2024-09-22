resource "aws_secretsmanager_secret" "db_password" {
  name = "db_password"
}

resource "aws_secretsmanager_secret_version" "db_password" {
    secret_id = aws_secretsmanager_secret.db_password.id
    secret_string = var.rds_postgre_password
}

resource "aws_secretsmanager_secret" "db_user" {
  name = "db_user"
}

resource "aws_secretsmanager_secret_version" "db_user" {
    secret_id = aws_secretsmanager_secret.db_user.id
    secret_string = var.rds_postgre_user
}