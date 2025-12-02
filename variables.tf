variable "edgerc_path" {
  type    = string
  default = "~/.edgerc"
}

variable "config_section" {
  type    = string
  default = "akamaiu"
}

variable "contract_id" {
  type    = string
  default = "ctr_1-1NC95D"
}

variable "group_id" {
  type    = string
  default = "grp_241797"
}

variable "activate_latest_on_staging" {
  type    = bool
  default = true
}

# variable "activate_latest_on_production" {
#   type    = bool
#   default = false
# }

variable "dns_zone" {
  type    = string
  default = "virajterra.gsslab.com"
}
variable "property_id" {
  type    = string
  default = "prp_1291915"
}
variable "property_name" {
  type    = string
  default = "Viraj_Terra_Lab_2025"
}
variable "property_hostnames" {
  type    = list(string)
  default = ["test.virajterra.gsslab.com", "test1.virajterra.gsslab.com"]
}
variable "edge_hostname" {
  description = "Akamai Edge Hostname"
  type        = string
  default     = ".edgesuite.net"
}
variable "challenge_validations" {
  description = "Set to true or false whether you want to create the Secure By Default DNS validation records"
  type        = bool
  default     = true
}
