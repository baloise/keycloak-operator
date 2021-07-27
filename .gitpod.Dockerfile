FROM gitpod/workspace-full

# Install net tools like netstat...
#
RUN apt-get update \
&& apt-get install -y net-tools \
&& apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
# Install Operator SDK
RUN cd /tmp \
&& curl -Lo operator-sdk https://github.com/operator-framework/operator-sdk/releases/download/v0.18.2/operator-sdk-v0.18.2-x86_64-linux-gnu \
&& chmod +x operator-sdk \
&& mv operator-sdk /usr/local/bin/ 

USER gitpod
