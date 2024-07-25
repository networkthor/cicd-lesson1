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


