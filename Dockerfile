FROM debian:jessie

RUN apt-get update 
RUN apt-get install -y git
RUN apt-get install -y socat jq curl openssl parallel

RUN git clone --branch 1.1.2 https://github.com/nasoym/bss.git

WORKDIR /bss
COPY handlers/* /bss/handlers
ENV PATH /bss/handlers:$PATH

EXPOSE 8080

CMD ["./run.sh"]

