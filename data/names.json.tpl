{
  "generic": {
    "long_sep": "${name_prefix}${s}",
    "short_sep": "${join (s,[customer_prefix, env ,app_name_short,random])}${s}",
    "short": "${customer_prefix}${env}${location_code}${app_name_short}${random}"
  },
  "resource_type": {
    "azurerm_storage_account": {
      "name": "${customer_prefix}${env}${location_code}${app_name_short}${random}st",
      "length": "24",
      "scope": "global",
      "validChars": "Lowercase letters and numbers.",
      "validRegex": "[^a-z0-9]"
    },
    "azurerm_resource_group": {
      "name": "${name_prefix}${s}rg",
      "length": "90",
      "scope": "subscription",
      "validChars": "Alphanumerics, underscores, parentheses, hyphens, periods, and unicode characters.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "azurerm_service_plan": {
      "name": "${name_prefix}${s}asplan",
      "length": "40",
      "scope": "resource group",
      "validChars": "Alphanumeric, hyphens and Unicode characters that can be mapped to Punycode.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "azurerm_app_service_environment_v3": {
      "name": "${name_prefix}${s}asenv",
      "length": "40",
      "scope": "resource group",
      "validChars": "Alphanumeric, hyphens and Unicode characters that can be mapped to Punycode",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "azurerm_linux_web_app": {
      "name": "${name_prefix}${s}${random}${s}wapp",
      "length": "60",
      "scope": "global",
      "validChars": "Alphanumeric, hyphens and Unicode characters that can be mapped to Punycode",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "azurerm_linux_function_app": {
      "name": "${name_prefix}${s}${random}${s}fapp",
      "length": "60",
      "scope": "global",
      "validChars": "Alphanumeric, hyphens and Unicode characters that can be mapped to Punycode",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "azurerm_linux_web_app_slot": {
      "name": "${name_prefix}${s}wslot",
      "length": "59",
      "scope": "site",
      "validChars": "Alphanumeric, hyphens and Unicode characters that can be mapped to Punycode",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "azurerm_linux_function_app_slot": {
      "name": "${name_prefix}${s}fslot",
      "length": "59",
      "scope": "site",
      "validChars": "Alphanumeric, hyphens and Unicode characters that can be mapped to Punycode",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "azurerm_linux_virtual_machine_scale_set": {
      "name": "${name_prefix}${s}vmss",
      "length": "90",
      "scope": "subscription",
      "validChars": "Alphanumerics, underscores, parentheses, hyphens, periods, and unicode characters.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "azurerm_lb": {
      "name": "${name_prefix}${s}lb",
      "length": "80",
      "scope": "resource group",
      "validChars": "Alphanumerics, underscores, periods, and hyphens.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "azurerm_network_security_group": {
      "name": "${name_prefix}${s}nsg",
      "length": "80",
      "scope": "resource group",
      "validChars": "Alphanumerics, underscores, periods, and hyphens.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "azurerm_bastion": {
      "name": "${name_prefix}${s}bas",
      "length": "90",
      "scope": "subscription",
      "validChars": "Alphanumerics, underscores, parentheses, hyphens, periods, and unicode characters.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "azurerm_public_ip": {
      "name": "${name_prefix}${s}pip",
      "length": "90",
      "scope": "subscription",
      "validChars": "Alphanumerics, underscores, parentheses, hyphens, periods, and unicode characters.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "azurerm_key_vault": {
      "name": "${join(s,[customer_prefix,env,app_name_short,random])}${s}kv",
      "length": "24",
      "scope": "global",
      "validChars": "Alphanumerics and hyphens.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "azurerm_application_insights": {
      "name": "${name_prefix}${s}${random}${s}appi",
      "length": "24",
      "scope": "global",
      "validChars": "Alphanumerics and hyphens.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "azurerm_log_analytics_workspace": {
      "name": "${name_prefix}${s}${random}${s}logws",
      "length": "24",
      "scope": "global",
      "validChars": "Alphanumerics and hyphens.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "azurerm_policy_set_definition": {
      "name": "${join (s,[customer_prefix,env,app_name_short,random])}${s}policy-set-def",
      "length": "24",
      "scope": "global",
      "validChars": "Alphanumerics and hyphens.",
      "validRegex": "[^a-zA-Z0-9]"
    },
    "azurerm_container_registry": {
      "name": "${customer_prefix}${env}${location_code}${app_name_short}${random}acr",
      "length": "24",
      "scope": "global",
      "validChars": "Lowercase, Uppercase and Numbers.",
      "validRegex": "[^a-zA-Z0-9]"
    },
    "azurerm_function_app": {
      "name": "${join (s,[customer_prefix, env ,app_name_short,random])}${s}func",
      "length": "24",
      "scope": "global",
      "validChars": "Alphanumerics and hyphens.",
      "validRegex": "[^a-zA-Z0-9]"
    },
    "azurerm_application_gateway": {
      "name": "${name_prefix}${s}${random}${s}appgw",
      "length": "80",
      "scope": "resource group",
      "validChars": "Alphanumerics and hyphens.",
      "validRegex": "[^a-zA-Z0-9]"
    },
    "azurerm_postgresql_server": {
      "name": "${name_prefix}${s}${random}${s}psql",
      "length": "63",
      "scope": "global",
      "validChars": "Lowercase letters, hyphens and numbers.",
      "validRegex": "[^a-z0-9-]"
    },
    "azurerm_postgresql_flexible_server": {
      "name": "${name_prefix}${s}${random}${s}fpsql",
      "length": "63",
      "scope": "global",
      "validChars": "Lowercase letters, hyphens and numbers.",
      "validRegex": "[^a-z0-9-]"
    },
    "aws_s3_bucket": {
      "name": "${name_prefix}${s}s3",
      "length": "24",
      "scope": "global",
      "validChars": "Lowercase letters and numbers.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_s3_bucket_policy": {
      "name": "${name_prefix}${s}s3${s}policy",
      "length": "90",
      "scope": "account",
      "validChars": "Alphanumerics, underscores, parentheses, hyphens, periods, and unicode characters.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_security_group": {
      "name": "${name_prefix}${s}sg",
      "length": "90",
      "scope": "account",
      "validChars": "Alphanumerics, underscores, parentheses, hyphens, periods, and unicode characters.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_lb": {
      "name": "${join (s,[customer_prefix, env ,location_code ,custom_name_short])}${s}lb",
      "length": "32",
      "scope": "account & region",
      "validChars": "Alphanumerics, underscores, parentheses, hyphens, periods, and unicode characters.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_cloudwatch_log_metric_filter": {
      "name": "${name_prefix}${s}cw${s}lmf",
      "length": "90",
      "scope": "account",
      "validChars": "Alphanumerics, underscores, parentheses, hyphens, periods, and unicode characters.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_cloudwatch_log_group": {
      "name": "${name_prefix}${s}cw${s}lg",
      "length": "90",
      "scope": "account",
      "validChars": "Alphanumerics, underscores, parentheses, hyphens, periods, and unicode characters.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_cloudwatch_metric_alarm": {
      "name": "${name_prefix}${s}cw${s}ma",
      "length": "90",
      "scope": "account",
      "validChars": "Alphanumerics, underscores, parentheses, hyphens, periods, and unicode characters.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_launch_template": {
      "name": "${name_prefix}${s}asg${s}lt",
      "length": "90",
      "scope": "account",
      "validChars": "Alphanumerics, underscores, parentheses, hyphens, periods, and unicode characters.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_autoscaling_group": {
      "name": "${name_prefix}${s}asg",
      "length": "90",
      "scope": "account",
      "validChars": "Alphanumerics, underscores, parentheses, hyphens, periods, and unicode characters.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_db_subnet_group": {
      "name": "${name_prefix}${s}db${s}subnet",
      "length": "90",
      "scope": "account",
      "validChars": "Alphanumerics, underscores, parentheses, hyphens, periods, and unicode characters.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_db_parameter_group": {
      "name": "${name_prefix}${s}pg",
      "length": "90",
      "scope": "account",
      "validChars": "Alphanumerics, underscores, parentheses, hyphens, periods, and unicode characters.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_db_instance": {
      "name": "${name_prefix}${s}rds${s}",
      "length": "90",
      "scope": "account",
      "validChars": "Alphanumerics, underscores, parentheses, hyphens, periods, and unicode characters.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_lb_target_group": {
      "name": "${join (s,[customer_prefix, env,custom_name_short,random])}${s}lb${s}tg",
      "length": "90",
      "scope": "account",
      "validChars": "Alphanumerics, underscores, parentheses, hyphens, periods, and unicode characters.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_iam_role": {
      "name": "${name_prefix}${s}iam${s}role",
      "length": "64",
      "scope": "account",
      "validChars": "Alphanumerics and hyphens.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_iam_role_policy": {
      "name": "${name_prefix}${s}iam${s}role${s}policy",
      "length": "128",
      "scope": "account",
      "validChars": "Alphanumerics and hyphens.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_sqs_queue": {
      "name": "${name_prefix}${s}${random}${s}sqs-queue",
      "length": "128",
      "scope": "account",
      "validChars": "Alphanumerics and hyphens.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_dlm_lifecycle_policy": {
      "name": "${name_prefix}${s}lifecycle",
      "length": "128",
      "scope": "account",
      "validChars": "Alphanumerics and hyphens.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_sns_topic": {
      "name": "${name_prefix}${s}sns${s}topic",
      "length": "128",
      "scope": "account",
      "validChars": "Alphanumerics and hyphens.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_iam_policy_document": {
      "name": "${name_prefix}${s}iam${s}policy",
      "length": "24",
      "scope": "global",
      "validChars": "Alphanumerics and hyphens.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_kms_key": {
      "name": "KMS key for topic${s}${name_prefix}${s}iam${s}policy${s}sns",
      "length": "24",
      "scope": "global",
      "validChars": "Alphanumerics and hyphens.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_kms_alias": {
      "name": "${s}${name_prefix}${s}policy${s}sns",
      "length": "24",
      "scope": "global",
      "validChars": "Alphanumerics and hyphens.",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_ecs_cluster": {
      "name": "${name_prefix}${s}ecs${s}cluster",
      "length": "255",
      "scope": "account",
      "validChars": "uppercase and lowercase, numbers, underscores, and hyphens are allowed",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_ssm_document": {
      "name": "${name_prefix}${s}SSM.json",
      "length": "255",
      "scope": "account",
      "validChars": "uppercase and lowercase, numbers, underscores, and hyphens are allowed",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_iam_instance_profile": {
      "name": "${name_prefix}${s}session${s}manager",
      "length": "255",
      "scope": "account",
      "validChars": "uppercase and lowercase, numbers, underscores, and hyphens are allowed",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_ecr_repository": {
      "name": "${name_prefix}${s}ecr",
      "length": "255",
      "scope": "account",
      "validChars": "uppercase and lowercase, numbers, underscores, and hyphens are allowed",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_ecs_task_definition": {
      "name": "${name_prefix}${s}task${s}definition",
      "length": "255",
      "scope": "account",
      "validChars": "uppercase and lowercase, numbers, underscores, and hyphens are allowed",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "aws_ecs_service": {
      "name": "${name_prefix}${s}ecs${s}service",
      "length": "255",
      "scope": "account",
      "validChars": "uppercase and lowercase, numbers, underscores, and hyphens are allowed",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "ssh-private-key": {
      "name": "${name_prefix}${s}${random}${s}ssh-private-key",
      "length": "255",
      "scope": "account",
      "validChars": "uppercase and lowercase, numbers, underscores, and hyphens are allowed",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "ssh-public-key": {
      "name": "${name_prefix}${s}${random}${s}ssh-public-key",
      "length": "255",
      "scope": "account",
      "validChars": "uppercase and lowercase, numbers, underscores, and hyphens are allowed",
      "validRegex": "[^a-zA-Z0-9_-]"
    },
    "ssh-openssh-public-key": {
      "name": "${name_prefix}${s}${random}${s}ssh-openssh-public-key",
      "length": "255",
      "scope": "account",
      "validChars": "uppercase and lowercase, numbers, underscores, and hyphens are allowed",
      "validRegex": "[^a-zA-Z0-9_-]"
    }

  }
}
