{
  "seperator": "-",
  "local": {
    "env": "${lower(env)}",
    "customer_prefix": "${lower(customer_prefix)}",
    "project": "${lower(project)}",
    "application": "${lower(application)}",
    "costcenter": "${lower(costcenter)}",
    "custom_name": "${lower(custom_name)}",
    "app_name_short": "${lower(substr(application, 0, 4))}",
    "custom_name_short": "${lower(substr(custom_name, 0, 4))}",
    "name_prefix": "${lower(join(s,[customer_prefix, env, location_code]))}${s}${length(custom_name) > 0 ? lower(join(s, [application, custom_name])) : lower(application) }",
    "random": "${random}"
  },
  "global_tags": {
    "gov:project": "${project}",
    "gov:application": "${application}",
    "ops:environment": "${upper(env)}",
    "cost:costcenter": "${costcenter}",
    "arch:module": "${module}"
  }
}
