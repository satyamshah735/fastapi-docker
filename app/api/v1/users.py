from fastapi import APIRouter, HTTPException

from app.schemas.user import User, UserCreate

router = APIRouter()

users: list[User] = []


@router.get("/", response_model=list[User])
async def get_users():
    return users


@router.post("/", response_model=User, status_code=201)
async def create_user(user: UserCreate):
    new_user = User(
        id=len(users) + 1,
        name=user.name,
        email=user.email,
    )

    users.append(new_user)

    return new_user


@router.get("/{user_id}", response_model=User)
async def get_user(user_id: int):
    for user in users:
        if user.id == user_id:
            return user

    raise HTTPException(
        status_code=404,
        detail="User not found",
    )