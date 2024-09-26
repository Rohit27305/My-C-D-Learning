terraform {
  required_providers {
    spotify = {
      source  = "conradludgate/spotify"
      version = "~> 0.2.0"
    }
  }
}

variable "api_key" {
  description = "API key for Spotify authentication"
  type        = string
  default = "replace_with_your_key"
}

provider "spotify" {
  api_key = var.api_key
}

