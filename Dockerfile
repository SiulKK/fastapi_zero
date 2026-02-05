From python:3.13
ENV POETRY_VIRTUALENVS_CREATE=false

WORKDIR app/
COPY . .

RUN pip install uv

RUN uv sync --no-dev

EXPOSE 8000
CMD uv run uvicorn --host 0.0.0.0 fastapi_zero.app:app