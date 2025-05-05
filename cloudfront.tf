# Create a CloudFront distribution
resource "aws_cloudfront_distribution" "website_cdn" {
  origin {
    domain_name = aws_s3_bucket_website_configuration.website.website_endpoint
    origin_id   = "s3-website-origin"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"



  # List of custom domain names (CNAMEs)
  aliases = [
    "biswanathsah.me",
    "www.biswanathsah.me"
  ]
  

  # Default behavior for the CloudFront distribution
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "s3-website-origin"
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  price_class = "PriceClass_All" 

  # TLS/SSL configuration for HTTPS support using ACM
  viewer_certificate {
    acm_certificate_arn            = aws_acm_certificate.cert.arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
  }

  #
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  # Ensure ACM certificate is created before this distribution
  depends_on = [aws_acm_certificate.cert]
}
