FROM ruby:latest

ARG BASE_DIR
ARG USER
ARG GROUP=${USER}
ARG UID
ARG GID=${UID}

RUN apt-get update && apt-get install -y watchman

# Install app dependencies.
RUN gem install rails --version 7.0.8.3

# Create shared workspace.
RUN groupadd -g ${UID} ${USER}
RUN useradd -u ${UID} -g ${GID} -G root -s /usr/bin/bash -m ${USER}
RUN mkdir ${BASE_DIR} && chown ${USER}:${GROUP} ${BASE_DIR}

USER ${USER}

WORKDIR ${BASE_DIR}
