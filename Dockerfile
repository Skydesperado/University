FROM python:3.11.1-slim

LABEL maintainer="Skydesperado@iCloud.com"

WORKDIR /app/

COPY ./requirements.txt ./

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY ./ ./

RUN python manage.py collectstatic --no-input
