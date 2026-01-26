module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "dynamodb" {
  source = "./modules/dynamodb"
}

module "iam" {
  source = "./modules/iam"
}

module "lambda" {
  source       = "./modules/lambda"
  lambda_role  = module.iam.lambda_role_arn
  table_name   = module.dynamodb.table_name
}

module "apigateway" {
  source            = "./modules/apigateway"
  lambda_invoke_arn = module.lambda.lambda_invoke_arn
  lambda_name       = module.lambda.lambda_name
}
