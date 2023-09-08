variable "resource_group_name" {
  type = string
}

variable "dns_zone_name" {
  type = string
}

variable "dns_zone_a_records" {
  type = set(object({
    name    = string
    records = set(string)
    ttl     = optional(number, 3600)
    tags    = optional(map(string), {})
  }))
  default = []
}

variable "dns_zone_ns_records" {
  type = set(object({
    name    = string
    records = set(string)
    ttl     = optional(number, 3600)
    tags    = optional(map(string), {})
  }))
  default = []
}

variable "dns_zone_tags" {
  type    = map(string)
  default = {}
}
