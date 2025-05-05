#Create an ACM (AWS Certificate Manager) certificate
resource "aws_acm_certificate" "cert" {
  domain_name       = var.bucketname
  validation_method = "DNS"

  subject_alternative_names = [
    "www.${var.domain_name}"
  ]

  lifecycle {
    create_before_destroy = true
  }
}

  #Create records in Route-53
  resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }

  zone_id = aws_route53_zone.route_domain.zone_id
  name    = each.value.name
  type    = each.value.type
  ttl     = 60
  records = [each.value.record] 
}
