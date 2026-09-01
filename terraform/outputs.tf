output "server_ip" {
  value       = digitalocean_droplet.web_server.ipv4_address
  description = "Endereço IP público do servidor provisionado"
}