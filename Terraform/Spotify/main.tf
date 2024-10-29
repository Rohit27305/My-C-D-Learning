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
  default = "WU1_NEC2RDGGC55qPFKmiGMb-jEiCP-eVbXn6RiZuIt_VKLkl_DbGmZw0TEF86Pp"
}

provider "spotify" {
  api_key = var.api_key
}

