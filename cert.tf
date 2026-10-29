# resource "aws_acm_certificate" "cert" {
#   domain_name       = "bellz.us"
#   validation_method = "DNS"

#   tags = {
#     Environment = "test"
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

resource "aws_acm_certificate_validation" "cert" {
  certificate_arn = "arn:aws:acm:us-east-1:691212984313:certificate/8880f524-1435-417f-a787-19d0c732b49a"
}