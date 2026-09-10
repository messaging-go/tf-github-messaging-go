terraform {
  cloud {
    hostname     = "otaco.app"
    organization = "org_01M24P27F6715RHDPKSSCT1A1W"
    workspaces {
      name = "79cfb695-2517-429b-b2d3-8fabf66cbdde"
    }
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  owner             = "messaging-go"
  parallel_requests = true
  token             = var.gh_token
}
