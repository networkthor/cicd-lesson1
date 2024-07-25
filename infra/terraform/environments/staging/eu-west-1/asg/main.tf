// Create Network resources
module "network" {
  source = "github.com/networkthor/terraform-module-network.git?ref=master"
  environment     = var.environment
  cidr_block      = var.cidr_block
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  
  tags            = {
    Git_repo   = "terraform-resources"
    Git_branch = "main"
  }

}


module "elb" {
  source = "github.com/networkthor/terraform-module-elb.git?ref=XYZ-6105-refactor-elb-module"
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

# module "autoscaling" {
#   source = "github.com/networkthor/terraform-modules-autoscaling.git?ref=master"
#   vpc_id                 = module.network.vpc_id
#   elb_security_group_id  = module.elb.security_groups_id
#   environment            = var.environment
#   private_subnet1_id     = module.network.private_subnets_id[0]
#   private_subnet2_id     = module.network.private_subnets_id[1]
#   target_group_arn       = module.elb.target_group_arn
#   ami_id                 = var.ami_id
#   instance_type          = var.instance_type
#   key_name               = var.key_name
#   volume_size            = var.volume_size
#   volume_type            = var.volume_type
#   iam_instance_profile   = var.iam_instance_profile
# }


