ARG VERSION
FROM python:${VERSION}

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    # Remove imagemagick due to https://security-tracker.debian.org/tracker/CVE-2019-10131
    && apt-get purge -y imagemagick imagemagick-6-common 

# Temporary: Upgrade python packages due to https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-40897
# They are installed by the base image (python) which does not have the patch.
RUN python3 -m pip install --upgrade setuptools


LABEL maintainer="Rene Rieser"
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

CMD ["python","-u","main.py"]