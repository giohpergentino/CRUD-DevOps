# Projeto DevOps

Projeto Acadêmico - DevOps

Aplicação 
- o Criar uma aplicação que tenha elementos de GET e POST, usando transferência de arquivos JSON;
- A aplicação deve ter elementos de back-end e front-end;
- É opcional que a aplicação armazene e altere dados em uma base de dados;
- As partes da aplicação, front e back, o banco de dados e outros serviços necessários devem utilizar o Docker;
  
• GIT
- Usar GIT como ferramenta de gerenciamento de código fonte, com um mínimo de 3 branches;
- As branches devem atualizar um repositório no GITHUB;
- Sempre que houver atualizações nas branches Staging e Master, estas devem atualizar os códigos das aplicações em um servidor de nuvem AWS;
  
• Monitoramento e testes 
- Usar o Postman para a criação de testes de API e para a documentação da API;
- Usar o Zabbix para o monitoramento do ambiente. O Zabbix deve ser instalado a partir de Docker.


Docker

• Crie a rede Docker:
docker network create net-devops

• Construa e execute o contêiner MySQL:
docker build -t mysql .
docker run -d --name mysql --network net-devops -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=crud_user -e MYSQL_USER=giovanna -e MYSQL_PASSWORD=admin mysql

• Construa e execute o contêiner da API:
docker build -t api .
docker run -d --name api --network net-devops -p 8800:8800 api

• Construa e execute o contêiner do frontend:
docker build -t frontend .
docker run -d --name frontend --network net-devops -p 3000:80 frontend

• Verifique os logs dos contêineres:
docker logs api
docker logs frontend
docker logs mysql

• Verifique o Frontend
Acesse o frontend no navegador através de http://localhost:3000. A aplicação deve agora ser capaz de obter os dados dos usuários da API e exibi-los corretamente.

• Resumo
Verifique a URL da API: Certifique-se de usar o URL correto dependendo do ambiente (dentro do contêiner Docker ou localmente).
Configure CORS na API: Se necessário, permita que o frontend acesse a API.
Inicie todos os contêineres na mesma rede: Garanta que todos os contêineres estejam conectados e podem se comunicar.
Se seguir esses passos, você deve ser capaz de conectar o frontend à API e exibir os dados corretamente.


Zabbix - Monitoramento

Se você deseja usar o PostgreSQL em vez do MySQL para o Zabbix, e também quer conectar todos os containers (Zabbix, Frontend, Backend e PostgreSQL) na mesma rede Docker, vamos seguir esses passos. 

• Primeiro, crie uma rede Docker para os containers:
docker network create net-devops

• Agora, vamos criar e configurar os containers do PostgreSQL, Zabbix Server e da interface web do Zabbix:

Passo 1: Criar o container do PostgreSQL
docker run --name postgres-db --network net-devops -e POSTGRES_PASSWORD=mysecretpassword -e POSTGRES_DB=zabbix -d postgres:latest

Passo 2: Criar o container do Zabbix Server
docker run --name zabbix-server --network net-devops -e DB_SERVER_HOST=postgres-db -e DB_SERVER_PORT=5432 -e POSTGRES_DB=zabbix -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=mysecretpassword -d zabbix/zabbix-server-pgsql:latest

Passo 3: Criar o container da interface web do Zabbix
docker run --name zabbix-web --network net-devops -e DB_SERVER_HOST=postgres-db -e DB_SERVER_PORT=5432 -e POSTGRES_DB=zabbix -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=mysecretpassword -p 8080:8080 -d zabbix/zabbix-web-nginx-pgsql:latest

Passo 4: Acessar a interface web do Zabbix
Abra um navegador e acesse http://localhost:8080. O login padrão é Admin e a senha zabbix.

Passo 5: Configurar o monitoramento
Agora que o Zabbix está configurado e funcionando, você pode adicionar hosts e itens de monitoramento conforme necessário para monitorar sua aplicação.

Com essa configuração, todos os containers estão na mesma rede Docker (net-devops), o que permite a comunicação fácil entre eles. Certifique-se de ajustar as configurações de conexão do Zabbix Server e da interface web para se conectarem ao PostgreSQL corretamente.
