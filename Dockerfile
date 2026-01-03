FROM dunglas/frankenphp
 
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    libzip-dev \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libonig-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

WORKDIR /app

COPY . /app

# Copy existing application directory permissions
COPY --chown=www-data:www-data . /app

# Change the owner of the application directory to www-data
RUN chown -R www-data:www-data /app/storage /app/bootstrap/cache

EXPOSE 5173
EXPOSE 80 443
# ENTRYPOINT ["php", "artisan", "octane:frankenphp"]
# ENTRYPOINT ["php", "artisan", "octane:frankenphp", "--watch"]