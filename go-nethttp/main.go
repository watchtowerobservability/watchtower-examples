package main

import (
	"context"
	"encoding/json"
	"errors"
	"log"
	"net/http"
	"os"

	watchtower "github.com/watchtowerobservability/watchtower-go"
)

func main() {
	ctx := context.Background()
	shutdown, err := watchtower.Init(ctx, watchtower.Options{
		Endpoint:    getenv("WT_OTLP_ENDPOINT", "http://localhost:4318"),
		IngestKey:   os.Getenv("WT_INGEST_KEY"),
		ServiceName: getenv("WT_SERVICE", "go-nethttp-example"),
		BufferDir:   ".wt-buffer",
	})
	if err != nil {
		log.Fatal(err)
	}
	defer shutdown(ctx)

	mux := http.NewServeMux()
	mux.HandleFunc("/hello", func(w http.ResponseWriter, r *http.Request) {
		_ = json.NewEncoder(w).Encode(map[string]string{"hello": "watchtower"})
	})
	mux.HandleFunc("/boom", func(w http.ResponseWriter, r *http.Request) {
		watchtower.CaptureError(r.Context(), errors.New("boom from the Go example"))
		http.Error(w, "boom", http.StatusInternalServerError)
	})
	// Recover turns a panic into a captured error with stack and trace ids, then re-serves 500.
	log.Fatal(http.ListenAndServe(":8080", watchtower.Handler(watchtower.Recover(mux), "example")))
}

func getenv(k, def string) string {
	if v := os.Getenv(k); v != "" {
		return v
	}
	return def
}
