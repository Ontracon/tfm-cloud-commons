module "common" {
  source        = "../.."
  cloud_region  = "eu-central-1"
  global_config = var.global_config
  custom_name   = "MyName"
}

# All generated Output
output "tags" {
  value       = module.common.tags
  description = "A map of tags computed by the module based on the input variables."
}

output "locals" {
  value       = module.common.locals
  description = "A map which provides local variables computed by the given input variables."
}

# Just for demonstration, do not use in production as output stored unencrypted in state file.
output "random_password" {
  value       = module.common.random_password
  description = "A random password with autorotation & keepers based on Inputs."
  sensitive   = true
}

output "random_password_next_rotation" {
  value       = module.common.random_password_next_rotation
  description = "A random password with autorotation & keepers based on Inputs."
  sensitive   = false
}

