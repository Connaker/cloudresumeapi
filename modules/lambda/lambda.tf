

resource "aws_lambda_function" "my_lambda" {
  function_name = var.lambda_function_name
  description   = var.lambda_description
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  role          = var.lambda_role
  filename      = var.lambda_filename
  source_code_hash = var.lambda_source_code_hash
}