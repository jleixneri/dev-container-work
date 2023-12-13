ARG BASE_IMAGE=voestalpine/voestalpine-ubi9:latest
FROM public-container-catalog.voestalpine.net/${BASE_IMAGE}
LABEL maintainer="Rene Rieser"

# Packages installieren
ARG PYTHON_VERION=3
RUN dnf install -y python${PYTHON_VERION} python${PYTHON_VERION}-devel python${PYTHON_VERION}-pip

USER root
RUN groupadd -r dia && useradd --no-log-init -r -g dia dia

# set working directory
WORKDIR /app/

COPY main.py main.py

# Make non-root user owner of folder
RUN chown -R dia:dia /app

# Named Volumen - non Root
#https://github.com/docker/compose/issues/3270
RUN mkdir /app/data
RUN chown -R dia:dia /app/data
USER dia
VOLUME /app/data

ENV vers=PYTHON_VERION
CMD python${vers} -u main.py