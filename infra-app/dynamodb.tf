resource "aws_dynamodb_table" "basic-dynamodb-table" {
    name = "${var.env}-dynamodb-state-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = var.hash_key
  

attribute {
    name = var.hash_key
    type = "S"
}
tags = {
  Name = "iftu-state-table"
  Environment = var.env
}
}

