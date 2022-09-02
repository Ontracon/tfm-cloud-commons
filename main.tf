locals {
  commons_file = length(var.commons_file_json) > 0 ? var.commons_file_json : "${path.module}/data/common.json"
  #  data                = length(var.commons_file_json) > 0 ? jsondecode(file("${path.root}/${var.commons_file_json}")) : jsondecode(file("${path.module}/data/common.json"))
  data                = jsondecode(file(local.commons_file))
  local_file_template = length(var.local_file_json_tpl) > 0 ? var.local_file_json_tpl : "${path.module}/data/locals.json.tpl"
  names_file_template = length(var.naming_file_json_tpl) > 0 ? var.naming_file_json_tpl : "${path.module}/data/names.json.tpl"
  tmp                 = jsondecode(file(local.local_file_template))
  module              = file("${path.module}/version.txt")

  locals_data = jsondecode(templatefile(local.local_file_template, {
    s               = local.tmp.seperator
    location_code   = local.data.location_codes[var.cloud_region].code
    env             = var.global_config.env
    customer_prefix = var.global_config.customer_prefix == "" ? resource.random_string.customer_prefix.result : var.global_config.customer_prefix
    project         = var.global_config.project
    application     = var.global_config.application
    costcenter      = var.global_config.costcenter
    custom_name     = var.custom_name
    module          = local.module
    random          = resource.random_string.random.result
    #random_prefix   = module.random_string_prefix.result
  }))

  names_data = jsondecode(templatefile(local.names_file_template, {
    s                 = local.tmp.seperator
    location_code     = local.data.location_codes[var.cloud_region].code
    env               = local.locals_data.local.env
    customer_prefix   = local.locals_data.local.customer_prefix
    application       = local.locals_data.local.application
    costcenter        = local.locals_data.local.costcenter
    custom_name       = local.locals_data.local.custom_name
    app_name_short    = local.locals_data.local.app_name_short
    custom_name_short = local.locals_data.local.custom_name_short
    name_prefix       = local.locals_data.local.name_prefix
    module            = local.module
    random            = resource.random_string.random.result
  }))

  tags = merge(var.custom_tags, local.locals_data.global_tags)
}

resource "random_string" "random" {
  keepers = {
    env             = var.global_config.env,
    location_code   = local.data.location_codes[var.cloud_region].code,
    customer_prefix = var.global_config.customer_prefix,
    project         = var.global_config.project,
    application     = var.global_config.application,
    custom_name     = var.custom_name
  }
  length  = 6
  lower   = true
  numeric = true
  upper   = false
  special = false
}

resource "random_string" "customer_prefix" {
  keepers = {
    env             = var.global_config.env,
    location_code   = local.data.location_codes[var.cloud_region].code,
    customer_prefix = var.global_config.customer_prefix,
    project         = var.global_config.project,
    application     = var.global_config.application,
    custom_name     = var.custom_name
  }
  length  = 4
  lower   = true
  numeric = true
  upper   = false
  special = false
}
resource "time_rotating" "password" {
  count         = var.password_create ? 1 : 0
  rotation_days = var.password_rotation
  lifecycle {
    create_before_destroy = true
  }
}

resource "random_string" "password" {
  count = var.password_create ? 1 : 0
  keepers = {
    env             = var.global_config.env,
    location_code   = local.data.location_codes[var.cloud_region].code,
    customer_prefix = var.global_config.customer_prefix,
    project         = var.global_config.project,
    application     = var.global_config.application,
    custom_name     = var.custom_name
    time            = resource.time_rotating.password[0].id
  }
  length      = var.password_length
  lower       = true
  numeric     = true
  upper       = true
  special     = false # Special characters with Environment variables / shell scripting are difficult to handle and can cause issues.
  min_lower   = 3
  min_upper   = 3
  min_numeric = 3
}
