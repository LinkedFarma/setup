# Gruppy Setup

Repositório público para setup inicial dos sistemas da Gruppy.

Este repositório contém um script mínimo que automatiza a configuração do ambiente de desenvolvimento da Gruppy. Ele clona o repositório privado de configuração e executa o setup completo do ambiente.

## Uso

Para iniciar o setup da Gruppy na sua máquina, execute:

```bash
curl -fsSL https://raw.githubusercontent.com/LinkedFarma/setup/master/setup.sh | bash
```

## Requisitos

- **Git** instalado e configurado
- **Make** instalado
- **Acesso SSH** ao repositório privado `LinkedFarma/EnvironmentSetup`

Se você não tem acesso SSH configurado, o script irá falhar e mostrar instruções de como configurar.

## O que o script faz

1. Verifica se Git e Make estão instalados
2. Cria o diretório `gruppy` no local atual
3. Clona o repositório privado `EnvironmentSetup`
4. Executa `make setup` para configurar todo o ambiente

## Estrutura

Este é um repositório público e minimalista. A configuração real do ambiente fica no repositório privado `EnvironmentSetup`, que contém:
- Makefiles de setup
- Configurações de ambiente
- Scripts de instalação de dependências
- Configurações específicas da Gruppy

## Troubleshooting

### Erro ao clonar o repositório

Se você receber um erro de permissão ao clonar, significa que suas credenciais SSH não estão configuradas. Siga os passos:

1. Gere uma chave SSH (se ainda não tiver):
   ```bash
   ssh-keygen -t ed25519 -C "seu_email@example.com"
   ```

2. Adicione a chave ao GitHub:
   - Copie a chave pública: `cat ~/.ssh/id_ed25519.pub`
   - Acesse https://github.com/settings/ssh/new
   - Cole a chave e salve

3. Teste a conexão:
   ```bash
   ssh -T git@github.com
   ```
