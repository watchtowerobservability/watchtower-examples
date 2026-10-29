# Go net/http example

```sh
export WT_INGEST_KEY=...   # shell only; never commit it
go run .
curl localhost:8080/hello; curl localhost:8080/boom
```

Uses `github.com/watchtowerobservability/watchtower-go` (`Init`, `Handler`, `Recover`, `CaptureError`).
