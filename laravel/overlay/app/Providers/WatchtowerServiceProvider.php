<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Watchtower\Config;
use Watchtower\Watchtower;

class WatchtowerServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        // Reads WT_INGEST_KEY, WT_OTLP_ENDPOINT, WT_ENVIRONMENT, WT_RELEASE from the environment.
        $this->app->singleton('watchtower.tracer_provider', fn () => Watchtower::init(Config::fromEnv(env('WT_SERVICE', 'laravel-example'))));
    }

    public function boot(): void
    {
        $this->app->make('watchtower.tracer_provider');
    }
}
