FROM python:3.11.1-slim

LABEL maintainer="Skydesperado@iCloud.com"

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY ./ /app/

RUN mkdir staticfiles

CMD python3 manage.py collectstatic --no-input
