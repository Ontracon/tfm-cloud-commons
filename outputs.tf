output "data" {
  value       = local.data
  description = "A Map of common data based on the input variables which can be referred from hcl."
}

output "locals" {
  value       = local.locals_data
  description = "A Map of useful locals based on the input variables which can be referred from hcl."
}

output "names" {
  value       = local.names_data
  description = "A Map of cloud resource names based on the input variables which can be referred from hcl."
}

output "tags" {
  value       = local.tags
  description = "A Map of tags based on the input variables which can be referred from hcl."
}

output "random_password" {
  value       = var.password_create ? resource.random_string.password[0].result : ""
  sensitive   = true
  description = "A generated random password with keepers based on the input variables global_config & custom_name."
}

output "random_password_next_rotation" {
  value       = var.password_create ? resource.time_rotating.password[0].rotation_rfc3339 : ""
  description = "Password next rotation in rfc3339 UTC Time."
}
