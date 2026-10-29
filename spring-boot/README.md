# Spring Boot example

```sh
export WT_INGEST_KEY=...            # shell only; never commit it
mvn spring-boot:run
curl localhost:8080/hello; curl localhost:8080/boom
```

Needs a GitHub token with `read:packages` for the `watchtower` server id in `~/.m2/settings.xml`, or install the attested jar from the SDK release with `mvn install:install-file`.
