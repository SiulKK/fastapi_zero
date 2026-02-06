#!/bin/sh
set -e

echo "⏳ Rodando migrações..."
uv run alembic upgrade head

echo "🚀 Subindo API..."
exec uv run uvicorn fastapi_zero.app:app \
  --host 0.0.0.0 \
  --port 8000