module "repository_sqs" {
  source      = "./modules/integration"
  name        = "sqs"
  description = "An integration for AWS SQS"
  topics      = ["aws", "sqs", "amazon"]
}
