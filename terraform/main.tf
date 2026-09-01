# Configuração do provedor da DigitalOcean
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Define o provedor e a chave de API (será lida da variável de ambiente TF_VAR_do_token)
provider "digitalocean" {
  token = var.do_token
}

# Variável para receber o token de acesso da DigitalOcean de forma segura
variable "do_token" {
  type        = string
  description = "Token de acesso da DigitalOcean"
  sensitive   = true
}

# Variável para a chave SSH cadastrada na DigitalOcean que dará acesso ao servidor
variable "ssh_fingerprint" {
  type        = description = "Fingerprint da chave SSH cadastrada na DigitalOcean"
  description = "Fingerprint da chave SSH cadastrada na DigitalOcean"
}

# Recurso: Criação do Droplet (Servidor Virtual)
resource "digitalocean_droplet" "web_server" {
  image    = "ubuntu-22-04-x64" # Sistema operacional base
  name     = "node-cicd-server" # Nome do servidor na nuvem
  region   = "nyc1"             # Região do datacenter (ex: Nova York)
  size     = "s-1vcpu-1gb"      # Tamanho/Plano da instância
  ssh_keys = [var.ssh_fingerprint] # Associa a chave SSH para acesso remoto

  tags = ["node-service", "ci-cd"]
}

# Output: Exibe o endereço IP público do servidor após o deploy
output "server_ip" {
  value       = digitalocean_droplet.web_server.ipv4_address
  description = "Endereço IP público do servidor provisionado"
}