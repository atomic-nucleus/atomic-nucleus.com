variable "resource_group_name" {
  type = string
}

variable "name" {
  type = string
}

variable "admin_enabled" {
  type    = bool
  default = true
}

variable "sku" {
  type    = string
  default = "Basic"
}

variable "tags" {
  type    = map(string)
  default = {}
}
