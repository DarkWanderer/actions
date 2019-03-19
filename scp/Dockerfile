FROM debian:stable-slim

LABEL "maintainer"="DarkWanderer <elquentaro@gmail.com>"
LABEL "repository"="https://github.com/DarkWanderer/actions"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Git Push"
LABEL "com.github.actions.description"="Push Git repository to remote server via SSH"
LABEL "com.github.actions.icon"="server"
LABEL "com.github.actions.color"="orange"

RUN apt-get update && \
  apt-get install -y openssh-client && \
  rm -Rf /var/lib/apt/lists/*

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
