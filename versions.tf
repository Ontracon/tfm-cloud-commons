terraform {
  required_version = "~> 1"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.8"
    }
  }
}
