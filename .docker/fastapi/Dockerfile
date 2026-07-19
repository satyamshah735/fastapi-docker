FROM python:3.14-slim-bookworm

ARG APPLICATION_UID=1000
ARG APPLICATION_GID=1000

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

ENV POETRY_HOME=/opt/poetry
ENV POETRY_VERSION=2.2.1
ENV POETRY_NO_INTERACTION=1

ENV VIRTUAL_ENV=/home/appuser/.venv

ENV PATH="${VIRTUAL_ENV}/bin:${POETRY_HOME}/bin:${PATH}"

RUN apt-get update && apt-get install -y \
    curl \
    gcc \
    build-essential \
    libpq-dev \
    git \
    bash \
    tini \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://install.python-poetry.org | python3 -

RUN groupadd \
        --gid ${APPLICATION_GID} appuser \
 && useradd \
        --uid ${APPLICATION_UID} \
        --gid appuser \
        --create-home \
        appuser

WORKDIR /app

RUN python -m venv ${VIRTUAL_ENV}

COPY pyproject.toml poetry.lock* ./

RUN poetry config virtualenvs.in-project true

RUN poetry install

COPY .docker/fastapi/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

USER appuser

EXPOSE 8080

ENTRYPOINT ["/usr/bin/tini", "--", "bash", "/usr/local/bin/docker-entrypoint.sh"]

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080", "--reload"]