# Use a imagem oficial do PHP 8.3 FPM
FROM php:8.3-fpm

# Argumentos de build para o usuário e UID
ARG user=FirstDecision
ARG uid=1000

# Instalar dependências do sistema e extensões do PHP
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd sockets \
    && pecl install -o -f redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copiar o Composer da imagem oficial
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Criar o usuário do sistema para executar comandos do Composer e Artisan
RUN useradd -G www-data,root -u $uid -d /home/$user $user \
    && mkdir -p /home/$user/.composer \
    && chown -R $user:$user /home/$user

# Definir o diretório de trabalho
WORKDIR /var/www

# Copiar configurações personalizadas do PHP
COPY docker/php/custom.ini /usr/local/etc/php/conf.d/custom.ini

# Mudar para o usuário não root
USER $user

