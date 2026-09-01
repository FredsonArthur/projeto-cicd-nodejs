variable "do_token" {
  type        = string
  description = "Token de acesso da DigitalOcean"
  sensitive   = true
}

variable "ssh_fingerprint" {
  type        = string
  description = "Fingerprint da chave SSH cadastrada na DigitalOcean"
}