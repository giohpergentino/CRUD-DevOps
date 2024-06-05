# Projeto DevOps

Projeto Acadêmico - DevOps

Documentação da API:

A solicitação HTTP GET recupera dados de http://3.145.63.138:8800/. A resposta retornou um código de status 200 e o tipo de conteúdo é application/json. O corpo da resposta é um array de objetos com chaves "id", "nome", "email", "fone", "data_nascimento" e "criado_em". Abaixo está o esquema JSON para o corpo da resposta:

JSON
[
  {
    "id": "number",
    "nome": "string",
    "email": "string",
    "fone": "string",
    "data_nascimento": "string",
    "criado_em": "string"
  }
]

Cada objeto representa um registro com valores de atributos correspondentes.