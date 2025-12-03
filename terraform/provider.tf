terraform {
  backend "s3" {
    bucket = "sacloud-terraform"
    key    = "terraform.tfstate"
    region = "jp-north-1"
    endpoints = {
      s3 = "https://s3.isk01.sakurastorage.jp"
    }
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_region_validation      = true
    skip_metadata_api_check     = true
    skip_s3_checksum            = true
  }
  required_providers {
    sakuracloud = {
      source  = "sacloud/sakuracloud"
      version = "2.31.2"
    }
  }
}

provider "sakuracloud" {}
