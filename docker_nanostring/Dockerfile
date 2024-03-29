FROM rocker/rstudio:4.2.0

MAINTAINER vbarrera@hsph.harvard.edu

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

# Recommended libraries from https://www.r-bloggers.com/running-your-r-script-in-docker/

RUN apt-get update && \
	apt-get -y --no-install-recommends install --fix-missing \
	gdb \
	vim \
	libxml2-dev \
	libcairo2-dev \
	libsqlite3-dev \
	libmariadbd-dev \
	libpq-dev \
	libssh2-1-dev \
	unixodbc-dev \
	libcurl4-openssl-dev \
	libssl-dev \
	libbz2-dev \
	liblzma-dev \
	python3-pip \
	libz-dev \
	libpng-dev \
        default-jre\
	default-jdk \
	libjpeg-dev \
	libxt6 \
	&& rm -rf /var/lib/apt/lists/*

RUN export LD_LIBRARY_PATH=/usr/lib/jvm/default-java/lib/amd64:/usr/lib/jvm/default-java/jre/lib/amd64/server

# Reconfigure java for R 
RUN R CMD javareconf

USER root
RUN usermod --shell /bin/bash rstudio

# Install R packages

COPY install.R /tmp/

# invalidates cache every 24 hours
ADD http://master.bioconductor.org/todays-date /tmp/

RUN R -f /tmp/install.R
