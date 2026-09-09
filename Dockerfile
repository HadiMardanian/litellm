# Railway deployment: lightweight LiteLLM proxy (no database, fits free tier)
FROM ghcr.io/berriai/litellm:main-latest

WORKDIR /app

# Copy proxy config
COPY litellm_config.yaml /app/config.yaml

EXPOSE 4000

# Railway injects $PORT; default to 4000 locally
CMD ["--config", "/app/config.yaml", "--port", "4000", "--host", "0.0.0.0"]
