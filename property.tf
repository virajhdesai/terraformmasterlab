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

data "akamai_property_rules_template" "rules" {
  template_file = abspath("${path.module}/property-snippets/main.json")
}

resource "akamai_edge_hostname" "virajdesai1-edgekey-net" {
  contract_id   = var.contract_id
  group_id      = var.group_id
  ip_behavior   = "IPV4"
  edge_hostname = "virajdesai1.edgekey.net"
}

resource "akamai_property" "Viraj_Master_Lab_2023" {
  name        = "Viraj_Master_Lab_2023"
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = "prd_Fresca"
  hostnames {
    cname_from             = "viraj-fail.gsshappylearning.com"
    cname_to               = akamai_edge_hostname.virajdesai1-edgekey-net.edge_hostname
    cert_provisioning_type = "DEFAULT"
  }
  hostnames {
    cname_from             = "virajdesai1.gsshappylearning.com"
    cname_to               = akamai_edge_hostname.virajdesai1-edgekey-net.edge_hostname
    cert_provisioning_type = "DEFAULT"
  }
  hostnames {
    cname_from             = "virajdesaiterra.gsshappylearning.com"
    cname_to               = akamai_edge_hostname.virajdesai1-edgekey-net.edge_hostname
    cert_provisioning_type = "DEFAULT"
  }
  hostnames {
    cname_from             = "virajdesaiterra1.gsshappylearning.com"
    cname_to               = akamai_edge_hostname.virajdesai1-edgekey-net.edge_hostname
    cert_provisioning_type = "DEFAULT"
  }
  hostnames {
    cname_from             = "virajdesaiterra2.gsshappylearning.com"
    cname_to               = akamai_edge_hostname.virajdesai1-edgekey-net.edge_hostname
    cert_provisioning_type = "DEFAULT"
  }
  rule_format = "latest"
  rules       = data.akamai_property_rules_template.rules.json
}

# NOTE: Be careful when removing this resource as you can disable traffic
resource "akamai_property_activation" "Viraj_Master_Lab_2023-staging" {
  property_id                    = akamai_property.Viraj_Master_Lab_2023.id
  contact                        = ["videsa@akamai.com"]
  version                        = var.activate_latest_on_staging ? akamai_property.Viraj_Master_Lab_2023.latest_version : akamai_property.Viraj_Master_Lab_2023.staging_version
  network                        = "STAGING"
  note                           = "cachingrevert"
  auto_acknowledge_rule_warnings = true
}

# NOTE: Be careful when removing this resource as you can disable traffic
#resource "akamai_property_activation" "Viraj_Master_Lab_2023-production" {
#property_id                    = akamai_property.Viraj_Master_Lab_2023.id
#contact                        = ["videsa@akamai.com"]
#version                        = var.activate_latest_on_production ? akamai_property.Viraj_Master_Lab_2023.latest_version : akamai_property.Viraj_Master_Lab_2023.production_version
#network                        = "PRODUCTION"
#note                           = "True client ip"
#auto_acknowledge_rule_warnings = false
#}

