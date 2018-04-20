FROM        selenium/standalone-chrome

USER        root
# Add user for running tests
RUN         usermod -a -G 1000 seluser
RUN         apt-get update
RUN         apt-get install curl -y
RUN         curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN         apt-get install nodejs nano -y

# Create app directory
RUN         mkdir -p /usr/src/app
RUN         mkdir -p /usr/src/app/logs
RUN         mkdir -p /usr/src/app/output
COPY        . /usr/src/app
RUN         chown -R seluser:1000 /usr/src/app
WORKDIR     /usr/src/app
USER        seluser
# Install app dependencies
RUN         npm install --loglevel warn

# Replace Selenium container entrypoint
ENTRYPOINT  [ "/usr/src/app/run.sh" ]
