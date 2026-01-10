variable "key_vaults" { type = any }
variable "rg_names"   { type = map(string) }

variable "kv_allowed_ips" {
  type = list(string)
}
