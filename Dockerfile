# Railway deployment: lightweight LiteLLM proxy (no database, fits free tier)
FROM ghcr.io/berriai/litellm:main-latest

WORKDIR /app

# Copy proxy config
COPY litellm_config.yaml /app/config.yaml

EXPOSE 4000

# PaaS: reset image ENTRYPOINT so CMD runs cleanly, expand $PORT via shell
# --num_workers 1 + --telemetry False keeps RAM low (fits 256MB plans)
ENTRYPOINT []
CMD ["sh", "-c", "litellm --config /app/config.yaml --port ${PORT:-4000} --host 0.0.0.0 --num_workers 1 --telemetry False"]
