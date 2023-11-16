FROM python:3.11.1-slim

LABEL maintainer="Skydesperado@iCloud.com"

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app/

COPY ./requirements.txt ./

RUN pip install --upgrade pip && pip install -r requirements.txt

# RUN mkdir -p /app/staticfiles

COPY ./ ./

RUN python manage.py collectstatic --noinput
