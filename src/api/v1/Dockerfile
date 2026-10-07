FROM python:3.12.15-slim

COPY --from=ghcr.io/astral-sh/uv:0.12.5 /uv /usr/local/bin/uv

WORKDIR /app

COPY src/api/pyproject.toml src/api/uv.lock ./
RUN uv sync --locked --no-dev

COPY src/api/v1/main.py model/model.joblib ./

ENV PATH="/app/.venv/bin:$PATH"

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
