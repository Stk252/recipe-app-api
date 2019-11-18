FROM python:3.7-alpine
MAINTAINER Santiago Kummert

# Run python unbuffered, recommended for python on containers
ENV PYTHONUNBUFFERED 1

# Copy requirements from local requirements file and install it in the docker image
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Make app directory, makes it default and copies it from the local machine to the docker image
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Create user, -D = running applications only (no account, just running processes) adn switches to the user
RUN adduser -D user
USER user