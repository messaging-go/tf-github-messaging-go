variable "name" {
  type        = string
  description = "The name of the github repository"
  sensitive   = false
}

variable "description" {
  type        = string
  description = "The description of the repository"
  sensitive   = false
}

variable "topics" {
  type        = list(string)
  description = "The topics to attach to the repository"
  sensitive   = false
}

variable "required_status_checks" {
  type        = list(string)
  description = "The status checks to enforce to merge on to the default branch"
  default     = []
  sensitive   = false
}
