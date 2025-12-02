terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = ">= 6.3.0"
    }
  }
  required_version = ">= 1.0"
}

provider "akamai" {
  edgerc         = var.edgerc_path
  config_section = var.config_section
}

# resource "akamai_edge_hostname" "my_edgehostname" {
#   contract_id   = var.contract_id
#   group_id      = var.group_id
#   ip_behavior   = "IPV4"
#   product_id  = "prd_Fresca"
#   edge_hostname = "${var.property_hostnames[0]}${var.edge_hostname}"
# }

resource "akamai_property" "property_name" {
  name        = var.property_name
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = "prd_Fresca"
  dynamic "hostnames" {
    for_each = var.property_hostnames
    content {
    cname_from             = hostnames.value
    cname_to               = "${hostnames.value}${var.edge_hostname}"
    cert_provisioning_type = "DEFAULT"
    }
  } 
  rule_format = data.akamai_property_rules_builder.property_name_rule_default.rule_format
  rules       = data.akamai_property_rules_builder.property_name_rule_default.json
  version_notes = "Testing SBD"
}

# NOTE: Be careful when removing this resource as you can disable traffic
resource "akamai_property_activation" "property_name-staging" {
  property_id                    = akamai_property.property_name.id
  contact                        = ["videsa@akamai.com"]
  version                        = var.activate_latest_on_staging ? akamai_property.property_name.latest_version : akamai_property.property_name.staging_version
  network                        = "STAGING"
  note                           = "Testing SBD"
  auto_acknowledge_rule_warnings = true
}

# NOTE: Be careful when removing this resource as you can disable traffic
# # resource "akamai_property_activation" "property_name-production" {
# #   property_id                    = akamai_property.property_name.id
# #   contact                        = ["videsa@akamai.com"]
# #   version                        = var.activate_latest_on_production ? akamai_property.property_name.latest_version : akamai_property.property_name.production_version
# #   network                        = "PRODUCTION"
# #   note                           = "True client ip"
# #   auto_acknowledge_rule_warnings = false
# }
