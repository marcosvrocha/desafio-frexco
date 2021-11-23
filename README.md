# Desafio Frexco DevOps

Olá, para este desafio utilizei o projeto padrão do react com create-react-app.

Para o desafio utilizei o sistema operacional Windows, pois atualmente não possuo espaço no computador para instalar outro sistema, porém acredito que em um sistema Linux teria mais facilidade, devido a facil configuração do Docker em ambientes Linux. Para utilizar o Docker no Windows utilizo o Windows Subsystem for Linux (WSL2) e com este
realizei este desafio.

Para realizar o deploy da aplicação, segui os seguintes passos:

* Criei uma Dockerfile e nela configurei o Node com Yarn e já realizei a build com o comando "yarn build"

* Criei um arquivo nginx.conf e nele configurei o Nginx para ouvir a porta 80 e suas pastas padrões(/usr/share/nginx/html)

* No Docker file utilizei a build alpine do Nginx e copiei os arquivos da build react para a pasta padrão mencionada acima

* Após isso copiei o arquivo de configuração do Nginx para sua em /etc/nginx/conf.d

* Depois expus a porta 80 e rodei o comando de inicialização do Nginx "nginx -g daemon off"

* Por último criei o arquivo docker-compose e nele descrevi o servico frexco-frontend apontando para a porta 80 e utilizando a Dockerfile como base

### Observação:

Para o comando de inicialização do Nginx, utilizei o nginx -g daemon off pois após uma pequena pesquisa descobri que uma melhor prática é utilizar um serviço por container, devido a isso o Nginx é executado como processo príncipal.

# Como rodar a aplicação:

Para rodar aplicação basta clonar este repositório e com o comando docker compose up no terminal, ela estará online. Apóes isto abra o navegador em localhost:80