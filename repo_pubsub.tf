module "repository_pubsub" {
  source      = "./modules/integration"
  name        = "pubsub"
  description = "A pubsub v2 integration for messaging-go"
  topics      = ["google", "pubsub", "gcloud", "gcp"]
}
