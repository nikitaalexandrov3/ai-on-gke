terraform {
  backend "gcs" {
    bucket = "arturkamalov-tf-backend"
    prefix = "terraform/state/website"
  }
}
