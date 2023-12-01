# Basis Image von voestalpine laden
ARG BASE_IMAGE=voestalpine/voestalpine-ubi9:latest
FROM public-container-catalog.voestalpine.net/${BASE_IMAGE}
LABEL maintainer="Rene Rieser"

# Packages installieren
ARG PYTHON_VERION=3
RUN dnf install -y python${PYTHON_VERION} python${PYTHON_VERION}-devel python${PYTHON_VERION}-pip

RUN python${PYTHON_VERION} -m pip install --upgrade setuptools
