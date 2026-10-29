# Django example

```sh
python -m venv .venv && . .venv/bin/activate && pip install -r requirements.txt
export WT_INGEST_KEY=... WT_PROJECT_ID=...   # from your shell or a git-ignored env file
python app.py runserver
curl localhost:8000/hello; curl localhost:8000/boom
```

`app.py` is a single-file Django project; `watchtower.init` runs before the first request.
