variable "name" {
  type        = string
  default     = "nl004pa-tayler-dev"
  description = "Name for resources"
}

variable "location" {
  type        = string
  default     = "AustraliaEast"
  description = "Azure Location of resources"
}

variable "tags" {
  type = map(string)
}