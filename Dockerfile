FROM python:3.12-slim

WORKDIR /app

# dependências básicas do sistema
RUN apt-get update \
 && apt-get install -y build-essential curl \
 && rm -rf /var/lib/apt/lists/*

# instala uv
RUN pip install --no-cache-dir uv

# copia somente arquivos de dependência primeiro
COPY pyproject.toml uv.lock ./

# instala dependências (sem dev)
RUN uv sync --frozen --no-dev

# copia o resto do projeto
COPY . .

RUN chmod +x entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["./entrypoint.sh"]