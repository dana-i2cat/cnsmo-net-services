FROM alpine:3.4

# Set environment variable
ENV HOME 						/root
ENV TERM 						xterm

RUN apk update
RUN apk add     \
   bash         \
   openssl      \
   wget         \
   ca-certificates
RUN update-ca-certificates
RUN mkdir -p /usr/share/easy-rsa
RUN wget --no-check-certificate -P /tmp https://github.com/OpenVPN/easy-rsa/releases/download/2.2.2/EasyRSA-2.2.2.tgz
RUN tar -xvzf /tmp/EasyRSA-2.2.2.tgz -C /tmp     \
 && mv /tmp/EasyRSA-2.2.2/* /usr/share/easy-rsa  \
 && rm -rf /tmp/*

# Override used easy-rsa scripts for non-interactive ones
RUN ln -s /usr/share/easy-rsa /er
COPY ./build-ca /er/
COPY ./build-key /er/
COPY ./build-key-server /er/

ENV EASY_RSA					/usr/share/easy-rsa
ENV KEY_CONFIG					$EASY_RSA/openssl-1.0.0.cnf
