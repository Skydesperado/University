FROM python:3.11.1-slim

LABEL maintainer="Skydesperado@iCloud.com"

WORKDIR /app/

COPY ./requirements.txt ./

RUN pip install --upgrade pip && pip install -r requirements.txt

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /app/staticfiles

COPY ./ ./

RUN python manage.py collectstatic --noinput
