#!/bin/bash
# Make sure this file has executable permissions, run `chmod +x deploy.sh` to ensure it does

#install composer dependendcies without dev dependencies
composer install --optimize-autoloader --no-dev
#install NPM packages
npm i
# Build assets using NPM
npm run build
# Clear cache
php artisan optimize:clear
# Cache the various components of the Laravel application
php artisan config:cache
php artisan event:cache
php artisan route:cache
php artisan view:cache
# Run any database migrations
php artisan migrate --force --seed

