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

resource "akamai_edge_hostname" "virajdesai1-edgekey-net" {
  contract_id   = var.contract_id
  group_id      = var.group_id
  ip_behavior   = "IPV4"
  edge_hostname = "virajdesaiterra.edgesuite.net"
  product_id  = "prd_Fresca"
}

resource "akamai_property" "Viraj_Master_Lab_2025" {
  name        = "Viraj_Master_Lab_2025"
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = "prd_Fresca"
  hostnames {
    cname_from             = "test.virajterra.gsslab.com"
    cname_to               = akamai_edge_hostname.virajdesai1-edgekey-net.edge_hostname
    cert_provisioning_type = "DEFAULT"
  }
  hostnames {
    cname_from             = "test1.virajterra.gsslab.com"
    cname_to               = akamai_edge_hostname.virajdesai1-edgekey-net.edge_hostname
    cert_provisioning_type = "DEFAULT"
  }
  hostnames {
    cname_from             = "test2.virajterra.gsslab.com"
    cname_to               = akamai_edge_hostname.virajdesai1-edgekey-net.edge_hostname
    cert_provisioning_type = "DEFAULT"
  }
  rule_format = data.akamai_property_rules_builder.Viraj_Master_Lab_2025_rule_default.rule_format
  rules       = data.akamai_property_rules_builder.Viraj_Master_Lab_2025_rule_default.json
  version_notes = "Testing SBD"
}

# NOTE: Be careful when removing this resource as you can disable traffic
resource "akamai_property_activation" "Viraj_Master_Lab_2025-staging" {
  property_id                    = akamai_property.Viraj_Master_Lab_2025.id
  contact                        = ["videsa@akamai.com"]
  version                        = var.activate_latest_on_staging ? akamai_property.Viraj_Master_Lab_2025.latest_version : akamai_property.Viraj_Master_Lab_2025.staging_version
  network                        = "STAGING"
  note                           = "Testing SBD"
  auto_acknowledge_rule_warnings = true
}

# NOTE: Be careful when removing this resource as you can disable traffic
# # resource "akamai_property_activation" "Viraj_Master_Lab_2025-production" {
# #   property_id                    = akamai_property.Viraj_Master_Lab_2025.id
# #   contact                        = ["videsa@akamai.com"]
# #   version                        = var.activate_latest_on_production ? akamai_property.Viraj_Master_Lab_2025.latest_version : akamai_property.Viraj_Master_Lab_2025.production_version
# #   network                        = "PRODUCTION"
# #   note                           = "True client ip"
# #   auto_acknowledge_rule_warnings = false
# }
