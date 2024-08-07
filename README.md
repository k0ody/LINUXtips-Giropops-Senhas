# **Linuxtips Giropops Senhas**
Este repositório oferece um guia passo a passo para iniciar uma aplicação web em container. A aplicação consiste em um gerador de senhas aleatórias, e o processo de containerização é realizado utilizando práticas seguras e eficiência do Distroless

## **Requerimentos**
1- Docker instalado no seu sistema. Se não tiver, você pode encontrá-lo em [Docker Installation Guide](https://docs.docker.com/get-docker/).

2- Ter um contaier redis rodando

3- Criar uma network para os dois containers 

## **Clonando o Repositório**
Antes de iniciar a aplicação, você precisará clonar o repositório Git para obter os arquivos necessários. Para fazer isso, siga estas etapas:

```bash
git clone https://github.com/k0ody/LINUXtips-Giropops-Senhas.git

```

Após clonar o repositório, você estará pronto para iniciar a aplicação seguindo as instruções abaixo.


## **Iniciando a aplicação**
Criando a network:

```bash
docker network create -d bridge <nome da network>
```

Iniciando o container redis:

```bash
docker container run -d --network <nome da network criada> --name <nome do container> redis:7.2
```

Iniciando o container da aplicação, o container roda na porta 5000, você pode especificar outra porta para acesso externo:

```bash
docker container run -d -p <porta para acesso>:5000 --env REDIS_HOST=<nome do container redis> --network <nome da network criada> --name <nome para o container> k0dy/linuxtips-giropops-senha-distroless:1.0
```

Verificar se os containers estão rodando

```bash
docker container ls
```

Apos isso a aplicação estara disponivel na porta 5000 no host onde está sendo executado.


## **Análise de Segurança**
A imagem Docker utilizada foi submetida à análise de segurança pelo Trivy e nenhuma falha de segurança foi encontrada até o momento.

## **Distroless**
A imagem utilizada para a aplicação é baseada no conceito Distroless, que promove a segurança e a eficiência dos containers, fornecendo apenas as dependências necessárias para a execução da aplicação, sem um sistema operacional completo.

## **Repositório da Imagem Docker**
Você pode encontrar o repositório da imagem Docker no Docker Hub através do seguinte link:
[Docker hub K0dy](https://hub.docker.com/r/k0dy/linuxtips-giropops-senha-distroless).
