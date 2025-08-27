data "akamai_property_hostnames" "tf_demo_hostnames" {
  contract_id = var.contract_id
  group_id    = var.group_id
  property_id = var.property_id
}
# resource "akamai_dns_zone" "virajterra_gsslab_com" {
#   contract       = var.contract_id
#   zone           = var.dns_zone
#   type           = "primary"
#   comment        = "Created from Terraform Provider"
#   group          = var.group_id
#   sign_and_serve = false
# }
# locals {
#   dns_hostnames_no_zam = [for item in var.dns_hostnames : item if item != var.dns_zone]
# }

# resource "akamai_dns_record" "tf_demo_dns_hostnames" {

#   for_each = toset(local.dns_hostnames_no_zam)

#   zone       = var.dns_zone
#   recordtype = "CNAME"
#   ttl        = 60
#   target     = [var.edge_hostname]
#   name       = each.value
# }

# Create a map with the same length as dns_hostnames, otherwise if the resource creation depends on data.akamai_property_hostnames TF can't know how many resources it needs to create before the apply and fails.
locals {
  cert_status_map = {
    for idx, hostname in var.dns_hostnames : hostname => {
      data.akamai_property_hostnames.tf_demo_hostnames.hostnames[idx].cert_status[0].hostname = data.akamai_property_hostnames.tf_demo_hostnames.hostnames[idx].cert_status[0].target
    }
  }
}

resource "akamai_dns_record" "tf_demo_dns_validation" {

  for_each = var.challenge_validations ? local.cert_status_map : {}

  zone       = var.dns_zone
  recordtype = "CNAME"
  ttl        = 60
  target     = [values(each.value)[0]]
  name       = keys(each.value)[0]
}

# resource "akamai_dns_record" "dv_cname" {

#   # loop through each item in our known hostnames set
#   for_each = var.dns_hostnames

#   # get the key or value, same in this instance 
#   zone = var.dns_zone
#   name = "_acme-challenge.${each.value}"

#   # let's lookup target value from our map of maps with value from hostnames[] as key
#   target = [lookup(var.dv_records["_acme-challenge.${each.value}"], "target")]

#   recordtype = "CNAME"
#   ttl        = 60
# }
