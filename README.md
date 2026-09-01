# Node.js Service Deployment - Roadmap.sh

Projeto prático desenvolvido para o desafio de Node.js Service Deployment do roadmap.sh. O objetivo é implementar uma pipeline completa de CI/CD para uma aplicação Node.js, abrangendo infraestrutura, gerenciamento de configuração e automação.
## 🛠️ Tecnologias Utilizadas

    Node.js & Express: Aplicação web leve para simulação de serviço backend.

    Terraform: Infraestrutura como Código (IaC) para provisionamento de recursos.

    Ansible: Automação de configuração de servidores, instalação de dependências e gerenciamento de processos via PM2.

    Docker: Simulação de um ambiente de servidor remoto localmente (SSH).

    GitHub Actions: Automação da pipeline de Integração e Entrega Contínua (CI/CD).

## 📁 Estrutura do Projeto

    projeto-cicd-nodejs/
    ├── app/                  # Código-fonte da aplicação Node.js
    ├── terraform/            # Configurações de infraestrutura (IaC)
    ├── ansible/              # Playbooks e roles de configuração do servidor
    ├── docker-server/        # Configuração do container Docker para testes locais
    └── .github/workflows/    # Pipelines de CI/CD

## 🚀 Como Executar Localmente
1. Subir o Servidor Simulado (Docker)

### Para testar o deploy e o provisionamento sem precisar de um provedor de nuvem externo, suba o container que simula o servidor remoto:

    cd docker-server
    docker build -t mock-server .
    docker run -d --name meu-servidor-local -p 2222:22 -p 8080:80 mock-server

2. Executar o Ansible (Task #1)

### Com o servidor local ativo, navegue até a pasta do Ansible e execute o playbook para configurar o ambiente e subir a aplicação:

    cd ../ansible
    ansible-playbook node_service.yml -i inventory.ini

Desafio proposto por [roadmap.sh](https://roadmap.sh/projects/nodejs-service-deployment).