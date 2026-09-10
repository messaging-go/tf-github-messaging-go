module "repository_integration_template" {
  source                 = "../repository"
  description            = var.description
  topics                 = distinct(concat(var.topics, ["integration"]))
  name                   = var.name
  required_status_checks = distinct(concat(var.required_status_checks, ["Test", "Semantic Release", "Lint"]))
}
