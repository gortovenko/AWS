
resource "aws_lb" "three_tier_lb" {
  count           = length(aws_subnet.subnet_vpc1)
  internal        = true 
  load_balancer_type = "application"
  name            = "three-tier-loadbalancer-${count.index +1}"
  #name            = "three-tier-loadbalancer-1"
  security_groups = [aws_security_group.tree_tire_lb_sg.id]
  #subnets = [aws_subnet.subnets_vpc1[0].id,
  #          aws_subnet.subnet_vpc1[1].id]
  subnets         = [for subnet in aws_subnet.subnet_vpc1[*] : subnet.id]
  #subnets         = [for subnet in aws_subnet.subnet_vpc1[*] : subnet.id]
  

  idle_timeout    = 400
  #enable_cross_zone_load_balancing = false
  ip_address_type = "ipv4"
  

}


resource "aws_lb_target_group" "three_tier_tg" {
  count    = length(aws_vpc.vpc1)
  name     = "three-tier-lb-tg-${substr(uuid(), 0, 3)}-${count.index + 1}"
  port     = "443"
  protocol = "HTTPS"
  vpc_id   = aws_vpc.vpc1.id

  lifecycle {
    ignore_changes        = [name]
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "three_tier_lb_listener" {
  count             = length(aws_lb_target_group.three_tier_tg)
  #count             = length(aws_lb.three_tier_lb)
  
  load_balancer_arn = element(aws_lb.three_tier_lb[*].arn, count.index)
  port              = "${count.index + 80}"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = element(aws_lb_target_group.three_tier_tg[*].arn, count.index)
  }
}

