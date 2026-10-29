# Rails example

```sh
export WT_INGEST_KEY=...   # shell only; never commit it
bundle install             # GitHub Packages needs a token: bundle config rubygems.pkg.github.com USER:TOKEN
bundle exec rackup -p 3000
curl localhost:3000/hello; curl localhost:3000/boom
```

A one-file Rails app (`config.ru`); `Watchtower.init` runs before the app boots.
