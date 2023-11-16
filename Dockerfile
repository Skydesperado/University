FROM python:3.11.1-slim

LABEL maintainer="Skydesperado@iCloud.com"

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --upgrade pip && pip install -r requirements.txt

# RUN mkdir -p /app/staticfiles

COPY ./ /app/

RUN python manage.py collectstatic --noinput
