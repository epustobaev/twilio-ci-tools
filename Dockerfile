FROM node:12.21.0-buster

USER root

RUN apt-get update -y && \
    apt-get install libsecret-1-dev -y && \
    apt-get install python -y && \
    yarn global add twilio-cli && \
    twilio plugins:install @twilio-labs/plugin-flex@beta && \
    twilio plugins:install @twilio-labs/plugin-serverless && \
    apt-get autoremove -y && \
    apt-get remove libsecret-1-dev -y && \
    apt-get clean -y && \
    mkdir /srv/twilio && \
    mv /root/.twilio-cli /srv/twilio/ && \
    chmod -R a+rwX /srv/twilio
