# IAM Role for Lambda
resource "aws_iam_role" "lambda_exec" {
  name = var.iam_role_name

  assume_role_policy = var.assume_role_policy
}

resource "aws_iam_role_policy" "lambda_policy" {
  role = aws_iam_role.lambda_exec.id

  policy = var.iam_role_policy_policy
}