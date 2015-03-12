FROM node:latest

ENV HOME /root

RUN mkdir -p ~/.ssh
RUN ssh-keyscan -H github.com >> ~/.ssh/known_hosts

#RUN echo 'host github.com' >> ~/.ssh/config
#RUN echo '     identityfile /root/.ssh/github.key' >> ~/.ssh/config

#ADD github.key/ /root/.ssh/
#RUN chmod 600 /root/.ssh/*

RUN  git clone https://eric_basley@bitbucket.org/redpelicans/proxy.git /proxy

RUN \
  cd /proxy && \
  npm install

ADD start.sh /start
VOLUME ["/config"]

WORKDIR /proxy
Expose 80
CMD ["bash", "/start"]

