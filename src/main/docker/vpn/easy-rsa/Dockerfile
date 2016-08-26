FROM alpine:3.4

# Set environment variable
ENV HOME 						/root
ENV TERM 						xterm

RUN apk update  \
 && apk add     \
   bash         \
   openssl      \
   wget         \
   ca-certificates  \
 && update-ca-certificates  \
 && wget -P /tmp https://github.com/OpenVPN/easy-rsa/releases/download/2.2.2/EasyRSA-2.2.2.tgz  \
 && tar -xvzf /tmp/EasyRSA-2.2.2.tgz -C /tmp     \
 && mkdir -p /usr/share/easy-rsa  \
 && mv /tmp/EasyRSA-2.2.2/* /usr/share/easy-rsa  \
 && rm -rf /tmp/*

# Create a shortcut to easy-rsa directory
RUN ln -s /usr/share/easy-rsa /er

ENV EASY_RSA					/usr/share/easy-rsa
ENV KEY_CONFIG					$EASY_RSA/openssl-1.0.0.cnf
