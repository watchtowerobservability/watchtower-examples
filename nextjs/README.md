# Next.js example

```sh
cp .env.example .env.local   # fill in WT_INGEST_KEY and WT_PROJECT_ID; never commit it
npm install && npm run dev
curl localhost:3000/api/hello; curl localhost:3000/api/boom
```

Uses `@watchtowerobservability/node` from `instrumentation.js`. The trace and the error appear in Watchtower linked by trace id.
