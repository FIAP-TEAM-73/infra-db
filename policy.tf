data "aws_iam_policy_document" "default_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::245903023069:role/voclabs"]
    }

    actions   = ["secretsmanager:GetSecretValue"]
    resources = ["*"]
  }
}

resource "aws_secretsmanager_secret_policy" "db_user_policy" {
  secret_arn = aws_secretsmanager_secret.db_user.arn
  policy     = data.aws_iam_policy_document.default_policy.json
}

resource "aws_secretsmanager_secret_policy" "db_password_policy" {
  secret_arn = aws_secretsmanager_secret.db_password.arn
  policy     = data.aws_iam_policy_document.default_policy.json
}

resource "aws_secretsmanager_secret_policy" "db_host_policy" {
  secret_arn = aws_secretsmanager_secret.db_host.arn
  policy     = data.aws_iam_policy_document.default_policy.json
}

resource "aws_secretsmanager_secret_policy" "db_url_policy" {
  secret_arn = aws_secretsmanager_secret.db_url.arn
  policy     = data.aws_iam_policy_document.default_policy.json
}