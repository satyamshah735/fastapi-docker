from fastapi import APIRouter

router = APIRouter()


@router.get("/")
async def root():
    return {
        "application": "FastAPI Template",
        "status": "running",
    }


@router.get("/health")
async def health():
    return {
        "status": "ok",
    }