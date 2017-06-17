FROM debian:jessie

MAINTAINER Sinan Goo

RUN apt-get update 
RUN apt-get install -y git socat jq curl openssl parallel
RUN git clone --branch 1.1.2 https://github.com/nasoym/bss.git

WORKDIR /bss
ENV PATH /bss/handlers:$PATH

RUN apt-get install -y stress-ng

COPY handlers/* /bss/handlers

ENV SOCAT_TIMEOUT 600

EXPOSE 8080

CMD ["./run.sh"]

