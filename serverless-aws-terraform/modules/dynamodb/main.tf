resource "aws_dynamodb_table" "messages" {
  name         = "baron-contact-messages"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "messageId"

  attribute {
    name = "messageId"
    type = "S"
  }
}

output "table_name" {
  value = aws_dynamodb_table.messages.name
}
