module "elb" {
  source = "git@github.com/networkthor/terraform-module-elb.git?ref=XYZ-6105-refactor-elb-module"
  environment        = var.environment
  public_subnet1_id  = module.network.public_subnets_id[0]
  public_subnet2_id  = module.network.public_subnets_id[1]
  lb_type            = var.lb_type
  vpc_id             = module.network.vpc_id
  security_group_rules = {
      allow_all_out = {
      type             = "egress"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

    http = {
      type             = "ingress"
      from_port        = 80
      to_port          = 80
      protocol         = "TCP"
      cidr_blocks      = ["0.0.0.0/0"]

    }
    https = {
      type             = "ingress"
      from_port        = 443
      to_port          = 443
      protocol         = "TCP"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }

}

