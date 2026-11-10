# --- build stage ---
FROM python:3.13-slim AS build
COPY --from=ghcr.io/astral-sh/uv:0.11 /uv /bin/
WORKDIR /app
COPY pyproject.toml uv.lock ./
RUN uv sync --locked --no-dev

# --- runtime stage ---
FROM python:3.13-slim
WORKDIR /app
COPY --from=build /app/.venv /app/.venv
COPY app.py ./
COPY pyproject.toml ./
ENV PATH="/app/.venv/bin:$PATH"
EXPOSE 8080
CMD ["python", "app.py"]