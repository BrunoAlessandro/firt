Passo a passo
1. Clonar o Repositório de Configuração
Clone o repositório que contém a configuração Docker:


### Passo a passo

git clone https://github.com/laravel/laravel.git app-laravel
3. Copiar Arquivos de Configuração
Copie os arquivos docker-compose.yml, Dockerfile e o diretório docker/ para o seu projeto Laravel:

sh
cp -rf setup-docker-laravel/* app-laravel/
cd app-laravel/
4. Criar o Arquivo .env
Crie uma cópia do arquivo .env.example e renomeie para .env:

sh
cp .env.example .env
5. Atualizar Variáveis de Ambiente
Atualize as variáveis de ambiente no arquivo .env conforme necessário:

dosini

APP_NAME="First Decision"
APP_URL=http://localhost:4200

DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=root

CACHE_DRIVER=redis
QUEUE_CONNECTION=redis
SESSION_DRIVER=redis

REDIS_HOST=redis
REDIS_PASSWORD=null
REDIS_PORT=6379
6. Subir os Containers
Suba os containers do projeto:

sh
docker-compose up -d
7. Acessar o Container da Aplicação
Acesse o container da aplicação para executar comandos do Artisan:

sh
docker-compose exec app bash
8. Instalar Dependências do Projeto
Dentro do container, instale as dependências do projeto com o Composer:

sh
composer install
9. Gerar a Chave do Projeto Laravel
Ainda dentro do container, gere a chave do projeto Laravel:

sh
php artisan key:generate
10. Acessar o Projeto
Abra seu navegador e acesse o projeto em http://localhost:4200/