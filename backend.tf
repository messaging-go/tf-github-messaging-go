terraform {
  cloud {
    hostname = "otaco.app"
    organization = "org_01M24P27F6715RHDPKSSCT1A1W"
    workspaces {
      name = "dfb837b2-2ad1-41e0-a968-bbf5b7794dc0"
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
  owner = "messaging-go"
  parallel_requests = true
}

