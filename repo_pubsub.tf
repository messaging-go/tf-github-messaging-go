module "repository_pubsub" {
  source      = "./modules/integration"
  name        = "pubsub"
  description = "A compatiable integration for version 2 of google pubsub"
  topics      = ["google", "pubsub", "gcloud", "gcp"]
}
