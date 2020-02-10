FROM boxfuse/flyway:5.2.4
WORKDIR /scripts
ENTRYPOINT ["/scripts/run.sh"]


RUN apt-get update && apt-get install  -y \
	locales curl apt-transport-https debconf-utils \
    && rm -rf /var/lib/apt/lists/*

# RUN locale-gen en_US.UTF-8
# RUN update-locale LANG=en_US.UTF-8

# adding custom MS repository
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list


RUN apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql mssql-tools
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"

# RUN /opt/mssql-tools/bin/sqlcmd -?

COPY ./scripts /scripts
RUN chmod +x /scripts/**.sh