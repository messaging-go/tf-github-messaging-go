module "repository_integration_template" {
  source                 = "./modules/repository"
  description            = "A GitHub template repository to start integrations off from. Use this template when you want to create middlewares for adding support for messaging platform, adding utilities, etc"
  topics                 = ["template", "integration"]
  name                   = "integration-template"
  required_status_checks = ["Test", "Semantic Release", "Lint"]
  is_template            = true
}
