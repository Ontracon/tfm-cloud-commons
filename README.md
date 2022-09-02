# tfm-cloud-commons

Module for define central common variables and naming of ressources which are used within the OTC provided terraform modules. The commons module enables central changes for Data and Naming of ressources. Overrides of the data can bemade from outside without changing individual modules or the commons module.

## Usage

The commons has defined map outputs which can be used within the modules to reference data from the commons module like services, BMW Networks and Resource Names.

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
-   names: A map of names based on the terraform resource type which can be referred as `module.common.names.resource_type["azurerm_key_vault"].name` = cnaa-dev-comm-qejmlh-kv
-   tags: A map of tags computed by the module.
-   random_password: A random password which will not change based on the provided global input variables & the custom name. It has Autorotation activated (default 1 day) which will change the password on the next apply when "random_password_next_rotation" UTC time is reached.

For a full output of available data use the provided [10-simple example](examples/10-simple/main.tf) and [20-advanced example](examples/20-advanced/main.tf).

## Customizing

Customizing can be done from the outside by replacing two json templates:

-   [commons_file_json_tpl](data/common.json.tpl): Definitions for locals, modules and fixed variables
-   [naming_file_json_tpl](data/names.json.tpl): Definition of resource names based on terraform resource type.

See the [30-complex example](examples/30-complex) for customizing data & names from outside.

# Module Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
