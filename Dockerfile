FROM ubuntu:16.04

# Install Davmail
RUN apt-get update \
    && apt-get install -yqq curl \
    && curl -sL https://downloads.sourceforge.net/project/davmail/davmail/4.8.0/davmail_4.8.0.3-2488-1_all.deb -o davmail.deb \
    && apt-get install -yqq default-jre libswt-gtk-3-java libswt-cairo-gtk-3-jni \
    && dpkg -i davmail.deb \
    && rm -rf davmail.deb /var/lib/apt/lists/*

# Ports: CalDAV, IMAP, LDAP, POP, SMTP
EXPOSE 1080 1143 1389 1110 1025

# Create davmail user and change to that user (do not run as root!)
RUN groupadd -r davmail && useradd -r -g davmail davmail
USER davmail

# Copy necessary configurations into an app folder
COPY app /app

CMD davmail /app/davmail.properties
