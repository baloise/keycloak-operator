FROM golang:1.15

# Copy CA Certificates for Baloise Proxy, because the interject https and replace server certificates
COPY Webgateway-PROD_CA.crt /usr/local/share/ca-certificates/Webgateway-PROD_CA.crt
COPY Zscaler_CA.crt /usr/local/share/ca-certificates/Zscaler_CA.crt
RUN update-ca-certificates

# Install net tools like netstat...
#
RUN apt-get update \
&& apt-get install -y net-tools \
&& apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
# Install Operator SDK
RUN cd /tmp \
&& curl -Lo operator-sdk -k https://github.com/operator-framework/operator-sdk/releases/download/v0.18.2/operator-sdk-v0.18.2-x86_64-linux-gnu \
&& chmod +x operator-sdk \
&& mv operator-sdk /usr/local/bin/

VOLUME ["/go/keycloak-operator"]

