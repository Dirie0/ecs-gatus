data "aws_acm_certificate" "issued" {
  domain   = "dirieisseprojects.co.uk"
  statuses = ["ISSUED"]
}
