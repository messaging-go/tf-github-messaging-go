terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

resource "github_repository" "repo" {
  name                   = var.name
  description            = var.description
  allow_auto_merge       = true
  allow_forking          = true
  allow_merge_commit     = false
  allow_squash_merge     = true
  allow_rebase_merge     = false
  archive_on_destroy     = true
  auto_init              = true
  delete_branch_on_merge = true
  topics                 = distinct(concat(var.topics, ["iac-managed"]))
  has_issues             = true
  has_discussions        = true
  homepage_url           = var.homepage_url
  is_template            = var.is_template
}

resource "github_branch_default" "default_branch" {
  branch     = "main"
  repository = github_repository.repo.name
}

resource "github_repository_ruleset" "require_pull_requests" {
  enforcement = "active"
  name        = "require_pull_requests"
  repository  = github_repository.repo.name
  target      = "branch"
  conditions {
    ref_name {
      exclude = []
      include = ["~DEFAULT_BRANCH"]
    }
  }

  rules {
    required_linear_history = true
    non_fast_forward        = true
    pull_request {
      allowed_merge_methods             = ["squash"]
      dismiss_stale_reviews_on_push     = true
      require_code_owner_review         = true
      require_last_push_approval        = true
      required_approving_review_count   = 1
      required_review_thread_resolution = true
    }
  }
}

resource "github_repository_ruleset" "require_signed_commits" {
  enforcement = "active"
  name        = "require_signed_commits"
  repository  = github_repository.repo.name
  target      = "branch"
  conditions {
    ref_name {
      exclude = []
      include = ["~DEFAULT_BRANCH"]
    }
  }

  rules {
    required_signatures = true
  }
}

resource "github_repository_ruleset" "require_status_checks" {
  enforcement = "active"
  name        = "require_status_checks"
  repository  = github_repository.repo.name
  target      = "branch"
  conditions {
    ref_name {
      exclude = []
      include = ["~DEFAULT_BRANCH"]
    }
  }
  rules {
    required_status_checks {
      strict_required_status_checks_policy = true
      do_not_enforce_on_create             = false
      dynamic "required_check" {
        for_each = var.required_status_checks
        content {
          context = required_check.value
        }
      }
    }
  }
}

resource "github_repository_dependabot_security_updates" "security_updates" {
  enabled    = true
  repository = github_repository.repo.name
}
