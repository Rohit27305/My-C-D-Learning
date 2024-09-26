# Spotify Playlist Creation with Terraform

This project demonstrates how to create a Spotify playlist using Terraform. The playlist is managed through the Spotify API, allowing for automated setup and configuration.

## Project Overview

- **Provider**: `conradludgate/spotify`
- **Terraform Version**: Ensure you are using a compatible version of Terraform.
- **API Key**: You need a valid Spotify API key for authentication.

## How to Use

### Prerequisites

1. Install [Terraform](https://www.terraform.io/downloads.html).
2. Obtain a Spotify API key by registering your application on the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/applications).
3. Clone this repository or create the files in your own directory.

### Configuration

1. Set up your `variables.tf` file to include your Spotify API key:

   ```hcl
   variable "api_key" {
     description = "API key for Spotify authentication"
     type        = string
   }

### URL of my playlist 
url : https://open.spotify.com/playlist/2ymQsws8jO0X9kHNSdc880

