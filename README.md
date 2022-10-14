# tfm-cloud-commons

<!--.test-default-test-start-->
[![OTC repo](https://img.shields.io/static/v1?logo=git&style=plastic&label=OTC%20repo&message=✓%205%20|✗%200%20|▲%201|➝%200&color=yellow)](https://github.com/Ontracon/tfm-cloud-commons/actions/runs/3250456582)
[![TF Base](https://img.shields.io/static/v1?logo=terraform&style=plastic&label=TF%20Base&message=✓%203%20|✗%200%20|▲%200|➝%200&color=success)](https://github.com/Ontracon/tfm-cloud-commons/actions/runs/3250456582)
[![TF Compliance (tflint)](https://img.shields.io/static/v1?logo=terraform&style=plastic&label=TF%20Compliance%20(tflint)&message=✓%201%20|✗%20%20|▲%201|➝%200&color=yellow)](https://github.com/Ontracon/tfm-cloud-commons/actions/runs/3250456582)
[![Security (Checkov)](https://img.shields.io/static/v1?logo=terraform&style=plastic&label=Security%20(Checkov)&message=✓%2039%20|✗%200%20|▲%200|➝%200&color=success)](https://github.com/Ontracon/tfm-cloud-commons/actions/runs/3250456582)
<!--.test-default-test-end-->

Module for define central common variables and naming of ressources which are used within the OTC provided terraform modules. The commons module enables central changes for Data and Naming of ressources. Overrides of the data can bemade from outside without changing individual modules or the commons module.

## Usage

The commons has defined map outputs which can be used within the modules to reference data from the commons module like services, Networks and Resource Names.

The minimum for invoking the module should be all mandatory variables:

| Variable        | Description                                  | Mandatory | Constraints                                                 |
| --------------- | -------------------------------------------- | --------- | ----------------------------------------------------------- |
| cloud_region    | Which cloud region / location should be used | ✔         | For Azure -> location & for AWS -> region                   |
| customer_prefix | Fixed customer prefix                        | ✗         | len 1-4, a-z, A-Z, 0-9 or empty string "" for random prefix |
| env             | Environment (dev/tst/int/uat/e2e/prd)        | ✔         | [dev, tst, int, uat, e2e, prd]                              |
| project         | procect identifier                           | ✔         | len 10, a-z, A-Z, - , 0-9                                   |
| application     | Application Name                             | ✔         | len 10, a-z, A-Z, - , 0-9                                   |
| costcenter      | Official cost center                         | ✔         | len 4, 0-9                                                  |
| custom_name     | Custom Name for the Resource deployment      | ✗         | len 10, a-z, A-Z, 0-9                                       |
| custom_tags     | Add custom tags from map to the tags         | ✗         | Map of custom tags                                          |

```hcl
module "common" {
  source        = "../.."
  cloud_region  = "eu-central-1"
  global_config = {
    customer_prefix = "OTC" # Can also be an empty String "". Empty string results in a random prefix!
    env             = "DEV"
    project         = "Common"
    application     = "Demo"
    costcenter      = "0815"
  }
}
```

Which gives you the following Output:

-   data: A map of common data which can be referred in hcl as `module.common.data.services["http"].port` = 80
-   names: A map of names based on the terraform resource type which can be referred as `module.common.names.resource_type["azurerm_key_vault"].name` = otc-dev-demo-qejmlh-kv
-   tags: A map of tags computed by the module.
-   random_password: A random password which will not change based on the provided global input variables & the custom name. It has Autorotation activated (default 1 day) which will change the password on the next apply when "random_password_next_rotation" UTC time is reached.

## Customizing

Customizing can be done from the outside by replacing two json templates:

-   [commons_file_json_tpl](data/common.json.tpl): Definitions for locals, modules and fixed variables
-   [naming_file_json_tpl](data/names.json.tpl): Definition of resource names based on terraform resource type.

See the [30-complex example](examples/30-complex) for customizing data & names from outside.

# Module Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version |
| ------------------------------------------------------------------------ | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1    |
| <a name="requirement_random"></a> [random](#requirement_random)          | ~> 3    |
| <a name="requirement_time"></a> [time](#requirement_time)                | >= 0.8  |

## Providers

| Name                                                      | Version |
| --------------------------------------------------------- | ------- |
| <a name="provider_random"></a> [random](#provider_random) | 3.4.3   |
| <a name="provider_time"></a> [time](#provider_time)       | 0.8.0   |

## Modules

No modules.

## Resources

| Name                                                                                                                   | Type     |
| ---------------------------------------------------------------------------------------------------------------------- | -------- |
| [random_string.customer_prefix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [random_string.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)        | resource |
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)          | resource |
| [time_rotating.password](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/rotating)        | resource |

## Inputs

| Name                                                                                          | Description                                                                       | Type                                                                                                                                                                                        | Default | Required |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | :------: |
| <a name="input_cloud_region"></a> [cloud_region](#input_cloud_region)                         | Define the cloud region to use (AWS Region / Azure Location) which tf should use. | `string`                                                                                                                                                                                    | n/a     |    yes   |
| <a name="input_commons_file_json"></a> [commons_file_json](#input_commons_file_json)          | Json file to override the commons fixed variables.                                | `string`                                                                                                                                                                                    | `""`    |    no    |
| <a name="input_custom_name"></a> [custom_name](#input_custom_name)                            | Set custom name for deployment.                                                   | `string`                                                                                                                                                                                    | `""`    |    no    |
| <a name="input_custom_tags"></a> [custom_tags](#input_custom_tags)                            | Set custom tags for deployment.                                                   | `map(string)`                                                                                                                                                                               | `null`  |    no    |
| <a name="input_global_config"></a> [global_config](#input_global_config)                      | Global config Object which contains the mandatory informations within OTC.        | <pre>object({<br>    env             = string<br>    customer_prefix = string<br>    project         = string<br>    application     = string<br>    costcenter      = string<br>  })</pre> | n/a     |    yes   |
| <a name="input_local_file_json_tpl"></a> [local_file_json_tpl](#input_local_file_json_tpl)    | Json template file to override the local settings template.                       | `string`                                                                                                                                                                                    | `""`    |    no    |
| <a name="input_module"></a> [module](#input_module)                                           | Module name & version for tagging.                                                | `string`                                                                                                                                                                                    | `""`    |    no    |
| <a name="input_naming_file_json_tpl"></a> [naming_file_json_tpl](#input_naming_file_json_tpl) | Json template file to override the naming template.                               | `string`                                                                                                                                                                                    | `""`    |    no    |
| <a name="input_password_create"></a> [password_create](#input_password_create)                | Should a random password be created.                                              | `bool`                                                                                                                                                                                      | `false` |    no    |
| <a name="input_password_length"></a> [password_length](#input_password_length)                | Random Password length.                                                           | `number`                                                                                                                                                                                    | `30`    |    no    |
| <a name="input_password_rotation"></a> [password_rotation](#input_password_rotation)          | Automatic password rotation in days on next terraform apply.                      | `number`                                                                                                                                                                                    | `1`     |    no    |

## Outputs

| Name                                                                                                                       | Description                                                                                        |
| -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| <a name="output_data"></a> [data](#output_data)                                                                            | A Map of common data based on the input variables which can be referred from hcl.                  |
| <a name="output_locals"></a> [locals](#output_locals)                                                                      | A Map of useful locals based on the input variables which can be referred from hcl.                |
| <a name="output_names"></a> [names](#output_names)                                                                         | A Map of cloud resource names based on the input variables which can be referred from hcl.         |
| <a name="output_random_password"></a> [random_password](#output_random_password)                                           | A generated random password with keepers based on the input variables global_config & custom_name. |
| <a name="output_random_password_next_rotation"></a> [random_password_next_rotation](#output_random_password_next_rotation) | Password next rotation in rfc3339 UTC Time.                                                        |
| <a name="output_tags"></a> [tags](#output_tags)                                                                            | A Map of tags based on the input variables which can be referred from hcl.                         |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
