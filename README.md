# **Linuxtips Giropops Senhas**

O repositorio abaixo contem um passo a passo para você iniciar uma aplicação web em container, essa aplicação é um gerador de senhas aleatorias

## **Requerimentos**

1- Docker instalado no seu sistema.

2- Ter um contaier redis rodando

3- Criar uma network para os dois containers 

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
docker container run -d -p <porta para acesso>:5000 --env REDIS_HOST=<nome do container redis> --network <nome da network criada> --name <nome para o container> k0dy/linuxtips-giropops-senhas:1.0
```

Verificar se os containers estão rodando

```bash
docker container ls
```

Apos isso a aplicação estara disponivel na porta 5000 no host onde está sendo executado.
