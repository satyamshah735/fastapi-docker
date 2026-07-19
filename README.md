# 🚀 FastAPI Template

A modern, Dockerized FastAPI starter template built for learning and production.

Current stage:

- ✅ FastAPI
- ✅ Docker
- ✅ Docker Compose
- ✅ Poetry
- ✅ Uvicorn
- ✅ Hot Reload
- ✅ Swagger UI
- ✅ Pydantic v2
- ✅ Ruff
- ✅ Pytest

Future stages will add:

- SQLAlchemy 2.0
- PostgreSQL
- Alembic
- Redis
- JWT Authentication
- Repository Pattern
- Service Layer
- Background Tasks
- Production Deployment

---

# Requirements

- Docker Desktop (or Docker Engine)
- Docker Compose v2

Verify Docker installation:

```bash
docker --version
docker compose version
```

---

# Project Structure

```text
fastapi-template/
│
├── .docker/
│   └── fastapi/
│
├── app/
│   ├── api/
│   ├── core/
│   ├── schemas/
│   └── main.py
│
├── tests/
│
├── compose.yml
├── pyproject.toml
├── start-docker.sh
├── app-cli.sh
├── README.md
└── .env.example
```

---

# Getting Started

## 1. Clone the repository

```bash
git clone <repository-url>
cd fastapi-template
```

---

## 2. Create the environment file

```bash
cp .env.example .env
```

---

## 3. Start Docker

```bash
bash start-docker.sh
```

Docker will:

- Build the FastAPI image
- Start the container
- Enable Hot Reload
- Start Uvicorn

---

# Stopping the project

```bash
bash start-docker.sh stop
```

---

# Restart

```bash
bash start-docker.sh restart
```

---

# View logs

```bash
bash start-docker.sh logs
```

---

# Open a shell inside the container

```bash
bash app-cli.sh
```

---

# Installing Packages

Inside the container:

```bash
poetry add sqlalchemy
```

or

```bash
poetry add fastapi-users
```

Development dependency:

```bash
poetry add --group dev pytest
```

No Docker rebuild is required.

---

# Running the API

The API runs on

```
http://localhost:8080
```

---

# Interactive API Documentation

Swagger UI

```
http://localhost:8080/docs
```

ReDoc

```
http://localhost:8080/redoc
```

---

# Current API

## Root

```
GET /
```

Example response:

```json
{
  "application": "FastAPI Template",
  "status": "running"
}
```

---

## Health Check

```
GET /health
```

Response

```json
{
  "status": "ok"
}
```

---

## Create User

```
POST /users
```

Example body

```json
{
  "name": "John Doe",
  "email": "john@example.com"
}
```

---

## List Users

```
GET /users
```

---

## Get User

```
GET /users/{user_id}
```

---

# Useful Commands

## Format code

```bash
ruff format .
```

---

## Lint

```bash
ruff check .
```

---

## Run tests

```bash
pytest
```

---

# Development Workflow

Start Docker

```bash
bash start-docker.sh
```

Open terminal

```bash
bash app-cli.sh
```

Install package

```bash
poetry add requests
```

Create new API

```
app/api/v1/
```

Hot Reload automatically reloads FastAPI.

---

# Next Stages

The following features will be added as the project evolves:

- SQLAlchemy 2.0
- PostgreSQL
- Alembic
- Redis
- Authentication
- JWT
- Generic Repository
- Service Layer
- Background Tasks
- Email
- Celery
- CI/CD
- Production Docker
- Nginx
- Monitoring

---

# License

MIT