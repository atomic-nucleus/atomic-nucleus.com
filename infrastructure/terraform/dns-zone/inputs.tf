variable "resource_group_name" {
  type = string
}

variable "name" {
  type = string
}

variable "a_records" {
  type = set(object({
    name    = string
    records = set(string)
    ttl     = optional(number, 3600)
    tags    = optional(map(string), {})
  }))
  default = []
}

variable "ns_records" {
  type = set(object({
    name    = string
    records = set(string)
    ttl     = optional(number, 3600)
    tags    = optional(map(string), {})
  }))
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
