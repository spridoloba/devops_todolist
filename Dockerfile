ARG PYTHON_VERSION=3.8
FROM python:${PYTHON_VERSION} AS base

WORKDIR /app
COPY . .

FROM python:${PYTHON_VERSION}-slim AS runserver

WORKDIR /app
COPY --from=base /app /app
ENV PYTHONUNBUFFERED=1

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    python manage.py migrate

ENV PYTHONUNBUFFERED=1
EXPOSE 8080
ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8080"]