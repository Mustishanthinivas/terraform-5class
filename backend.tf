terraform {
  backend "s3" {
    bucket = "devopsbuccket"
    key    = "iwilldelete"
    region = "us-east-1"
  }
}