resource "aws_secretsmanager_secret" "db_password" {
  name                    = "db_password"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "db_password" {
  secret_id     = aws_secretsmanager_secret.db_password.id
  secret_string = var.rds_postgre_password
}

resource "aws_secretsmanager_secret" "db_user" {
  name                    = "db_user"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "db_user" {
  secret_id     = aws_secretsmanager_secret.db_user.id
  secret_string = var.rds_postgre_user
}

resource "aws_secretsmanager_secret" "db_url" {
  name                    = "db_url"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "db_url" {
  secret_id     = aws_secretsmanager_secret.db_url.id
  secret_string = aws_db_instance.postgres-db-instance.address
}

resource "aws_secretsmanager_secret" "db_host" {
  name                    = "db_host"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "db_host" {
  secret_id     = aws_secretsmanager_secret.db_host.id
  secret_string = "postgres://${aws_secretsmanager_secret_version.db_user.secret_string}:${aws_secretsmanager_secret_version.db_password.secret_string}@${aws_secretsmanager_secret_version.db_url.secret_string}:5432/database_fastfood"
}