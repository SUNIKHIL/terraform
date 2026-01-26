variable "lambda_role" {}
variable "table_name" {}

resource "aws_lambda_function" "contact" {
  function_name = "baron-contact-handler"
  runtime       = "python3.12"
  handler       = "handler.lambda_handler"
  role          = var.lambda_role
  filename      = "lambda/function.zip"

  environment {
    variables = {
      TABLE_NAME = var.table_name
    }
  }
}

output "lambda_name" {
  value = aws_lambda_function.contact.function_name
}

output "lambda_invoke_arn" {
  value = aws_lambda_function.contact.invoke_arn
}