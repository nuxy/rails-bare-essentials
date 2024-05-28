FROM ruby:latest

ARG BASE_DIR
ARG USER
ARG GROUP=${USER}
ARG UID
ARG GID=${UID}

RUN groupadd -g ${UID} ${USER}
RUN useradd -u ${UID} -g ${GID} -G root -m ${USER}
RUN mkdir ${BASE_DIR}

USER ${USER}

WORKDIR ${BASE_DIR}

CMD sleep infinity
