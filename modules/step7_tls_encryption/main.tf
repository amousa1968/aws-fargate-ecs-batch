resource "null_resource" "https_listener" {
  triggers = {
    load_balancer_arn = var.load_balancer_arn
    port              = "443"
    protocol          = "HTTPS"
    ssl_policy        = "ELBSecurityPolicy-2016-08"
    certificate_arn   = var.certificate_arn
    target_group_arn  = var.target_group_arn
  }
}
