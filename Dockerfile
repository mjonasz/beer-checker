FROM ubuntu:16.04

RUN apt-get update && apt-get install -y wget locales

RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb

RUN apt-get update && apt-get install -y esl-erlang && apt-get install -y elixir

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

WORKDIR /app
