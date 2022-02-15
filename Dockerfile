FROM python:3.9-alpine

LABEL version="0.1"

RUN apk add --update jq

RUN pip install --upgrade pip
RUN pip install --upgrade awscli

ADD assets/ /opt/resource/
