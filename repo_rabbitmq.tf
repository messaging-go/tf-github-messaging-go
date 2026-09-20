module "repository_rabbitmq" {
  source      = "./modules/integration"
  name        = "rabbitmq"
  description = "RabbitMQ integration for messaging-go"
  topics      = ["rabbitmq"]
}
