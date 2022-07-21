# Terraform 0.13+ uses the Terraform Registry:
terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
  }
}

locals {
  env = { for tuple in regexall("(.*)=(.*)", file(".env")) : tuple[0] => tuple[1] }
}

# Configure the Datadog provider
provider "datadog" {
  api_key = local.env.DD_API_KEY
  app_key = local.env.DD_APP_KEY
}
