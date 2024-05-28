FROM ruby:latest

ARG USER
ARG GROUP=${USER}
ARG UID
ARG GID=${UID}

RUN groupadd -g ${UID} ${USER}
RUN useradd -u ${UID} -g ${GID} -G root -m ${USER}

USER ${USER}

WORKDIR /usr/src/app

CMD sleep infinity
