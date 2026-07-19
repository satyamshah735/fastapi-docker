from collections.abc import AsyncGenerator

from sqlalchemy.ext.asyncio import AsyncSession

from app.database.session import get_db


async def db_dependency() -> AsyncGenerator[AsyncSession, None]:
    async for session in get_db():
        yield session