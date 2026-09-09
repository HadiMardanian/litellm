# Railway deployment: lightweight LiteLLM proxy (no database, fits free tier)
FROM ghcr.io/berriai/litellm:main-latest

WORKDIR /app

# Copy proxy config
COPY litellm_config.yaml /app/config.yaml

EXPOSE 4000

# PaaS platforms inject $PORT; fall back to 4000 locally (shell form for env expansion)
CMD litellm --config /app/config.yaml --port ${PORT:-4000} --host 0.0.0.0
