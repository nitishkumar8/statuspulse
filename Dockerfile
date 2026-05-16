FROM python:3.12-slim AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y gcc libpq-dev

COPY app/requirements.txt .

RUN pip install --no-cache-dir --user -r requirements.txt

FROM python:3.12-slim

WORKDIR /app

RUN useradd -m appuser

COPY --from=builder /root/.local /home/appuser/.local

COPY app/ .

ENV PATH=/home/appuser/.local/bin:$PATH

RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 8000

HEALTHCHECK CMD curl --fail http://localhost:8000/health || exit 1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]