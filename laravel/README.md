# Laravel example

```sh
sh setup.sh                 # creates ./app from the Laravel skeleton and overlays this example
export WT_INGEST_KEY=...    # shell only; never commit it
cd app && php artisan serve
curl localhost:8000/hello; curl localhost:8000/boom
```

`overlay/` holds the only files that differ from a fresh Laravel app: two routes and a service provider that calls `Watchtower::init`.
