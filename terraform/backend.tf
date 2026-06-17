terraform {
  backend "s3" {
    bucket = "tfstate-dirie-project"
    key    = "dev/terraform.tfstate"
    region = "eu-west-1"
    encrypt= true
    use_lockfile= true

  }
}

