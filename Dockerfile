ARG PYTHON_VERSION=3.8
FROM python:${PYTHON_VERSION} as base

WORKDIR /app
COPY . .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    python manage.py migrate

FROM python:${PYTHON_VERSION}-slim as runserver

WORKDIR /app
COPY --from=base /app /app
ENV PYTHONUNBUFFERED=1

RUN pip install -r requirements.txt

EXPOSE 8080
ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8080"]