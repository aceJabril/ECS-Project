output "certificate_arn" {
    description = "Outputs certificate arn"
  value = aws_acm_certificate.ecs-cert.arn
}