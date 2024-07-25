module "autoscaling" {
  source = "git@github.com/networkthor/terraform-modules-autoscaling.git?ref=master"
  vpc_id                 = module.network.vpc_id
  elb_security_group_id  = module.elb.security_groups_id
  environment            = var.environment
  private_subnet1_id     = module.network.private_subnets_id[0]
  private_subnet2_id     = module.network.private_subnets_id[1]
  target_group_arn       = module.elb.target_group_arn
  ami_id                 = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  volume_size            = var.volume_size
  volume_type            = var.volume_type
  iam_instance_profile   = var.iam_instance_profile
}


