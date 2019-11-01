FROM python:3.7-alpine
# MAINTAINER hugocbp

ENV PYTHONUNBUFFERED 1

# Copy from machine to Docker image
COPY ./requirements.txt /requirements.txt

# Install requirements from the file (like Gemfile)
RUN pip install -r /requirements.txt

# Create folder on image, switches to it 
# and copy from machine to image
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Creates a non-root user just to run applications
RUN adduser -D user
USER user