output "validation" {
  value       = akamai_property.property_name.hostnames
  description = "DN-01 Challenges"
}

output "hostname_debug" {
    value = data.akamai_property_hostnames.tf_demo_hostnames
    description = "property hostnames"
}