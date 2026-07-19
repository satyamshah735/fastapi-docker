from collections.abc import AsyncIterator
from contextlib import asynccontextmanager

from fastapi import FastAPI


@asynccontextmanager
async def lifespan(_: FastAPI) -> AsyncIterator[None]:
    print("🚀 FastAPI starting...")

    yield

    print("🛑 FastAPI shutting down...")