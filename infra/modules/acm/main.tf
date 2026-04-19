resource "aws_acm_certificate" "ecs-cert" {
  domain_name       = var.domain
  validation_method = "DNS"

  tags = {
    Environment = "test"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "ecs-aws_acm_certificate_validation" {
  certificate_arn = aws_acm_certificate.ecs-cert.arn
}