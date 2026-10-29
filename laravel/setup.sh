#!/usr/bin/env sh
# Create a Laravel skeleton in ./app, install the SDK and overlay this example's files.
set -eu
cd "$(dirname "$0")"
[ -d app ] || composer create-project laravel/laravel app --no-interaction
cd app
composer config repositories.watchtower vcs https://github.com/watchtowerobservability/watchtower-php
composer require watchtowerobservability/sdk --no-interaction
cp ../overlay/routes/web.php routes/web.php
cp ../overlay/app/Providers/WatchtowerServiceProvider.php app/Providers/WatchtowerServiceProvider.php
grep -q WatchtowerServiceProvider bootstrap/providers.php || \
  sed -i.bak 's#^\];#    App\\Providers\\WatchtowerServiceProvider::class,\n];#' bootstrap/providers.php && rm -f bootstrap/providers.php.bak
echo "Set WT_INGEST_KEY in your shell, then: cd app && php artisan serve"
