# Create a Route53 hosted zone
resource "aws_route53_zone" "route_domain" {
  name = var.domain_name
}

output "route53_name_servers" {
  value = aws_route53_zone.route_domain.name_servers
}

# Create a Route53 alias record
resource "aws_route53_record" "root_alias" {
  zone_id = aws_route53_zone.route_domain.zone_id
  name    = "var.domain_name"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.website_cdn.domain_name
    zone_id                = aws_cloudfront_distribution.website_cdn.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_alias" {
  zone_id = aws_route53_zone.route_domain.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.website_cdn.domain_name
    zone_id                = aws_cloudfront_distribution.website_cdn.hosted_zone_id
    evaluate_target_health = false
  }
}

