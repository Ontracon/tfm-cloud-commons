terraform {
  required_version = ">= 1.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.3.2"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.8.0"
    }
  }
}
