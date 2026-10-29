# watchtower-examples

Runnable sample apps, each wired with the Watchtower SDK for its stack. No docker-compose: every
example runs with the stack's own tooling against your Watchtower endpoint.

Status: 0.x, early. Examples track the SDK versions pinned in each manifest.

## Install

Clone the repository and `cd` into one example directory. Each example needs a Watchtower ingest key
(publishable key for mobile) from your project settings.

## Quick start

```sh
git clone https://github.com/watchtowerobservability/watchtower-examples && cd watchtower-examples/go-nethttp
export WT_INGEST_KEY=...    # never commit it
go run .
```

## Examples

| Directory | Stack | SDK |
|---|---|---|
| `nextjs/` | Next.js 14 (App Router) | `@watchtowerobservability/node` |
| `django/` | Django 5, single file | `watchtower-sdk` (Python) |
| `spring-boot/` | Spring Boot 3 | `io.github.watchtowerobservability:watchtower-sdk` |
| `go-nethttp/` | Go net/http | `watchtower-go` |
| `rails/` | Rails 7, single file | `watchtower-sdk` (Ruby) |
| `laravel/` | Laravel 11, overlay on the skeleton | `watchtowerobservability/sdk` |
| `react-native/` | Expo / React Native | `@watchtowerobservability/react-native` |
| `flutter/` | Flutter 3 | `watchtower` (Dart) |

Each exposes `/hello` (a trace) and `/boom` (an error linked to that trace); the mobile apps have two buttons.

## Configuration

| Name | Meaning |
|---|---|
| `WT_INGEST_KEY` | Secret ingest key (server examples) |
| `WT_PROJECT_ID` | Project id (Node and Python examples) |
| `WT_OTLP_ENDPOINT` | Default `http://localhost:4318` |
| `WT_SERVICE` | `service.name` |
| `WT_ENVIRONMENT`, `WT_RELEASE` | Environment and release |

## Provenance

Every release artifact carries a GitHub build attestation. Verify one with
`gh attestation verify <file> --repo watchtowerobservability/watchtower-examples`.

## License

Apache-2.0. Source of truth is the Watchtower monorepo; this repository is a published mirror.
