FROM amazoncorretto:8

ARG RSTUDIO_VERSION=1.2.1335
ARG SHINY_VERSION=1.5.9.923
USER root

RUN amazon-linux-extras install -y epel

RUN yum groupinstall -y "AMI (minimal)"
RUN yum -y update && yum clean all
RUN yum -y install wget git xml2 libxml2-devel curl curl-devel openssl-devel openssl098e supervisor passwd pandoc

RUN yum -y install R

# Add RStudio binaries to PATH
ENV PATH /usr/lib/rstudio-server/bin/:$PATH
ENV LANG en_US.UTF-8

# Install Rstudio server:
RUN wget https://download2.rstudio.org/server/centos6/x86_64/rstudio-server-rhel-${RSTUDIO_VERSION}-x86_64.rpm
RUN yum -y install --nogpgcheck rstudio-server-rhel-${RSTUDIO_VERSION}-x86_64.rpm \
	&& rm -rf rstudio-server-rhel-${RSTUDIO_VERSION}-x86_64.rpm

RUN groupadd rstudio \
	&& useradd -g rstudio rstudio \
	&& echo rstudio | passwd rstudio --stdin

# Install Shiny server:
RUN R -e "install.packages(c('shiny', 'rmarkdown'), repos='http://cran.rstudio.com/')"
RUN wget https://download3.rstudio.org/centos6.3/x86_64/shiny-server-${SHINY_VERSION}-x86_64.rpm
RUN yum -y install --nogpgcheck shiny-server-${SHINY_VERSION}-x86_64.rpm \
	&& rm -rf shiny-server-${SHINY_VERSION}-x86_64.rpm

RUN mkdir -p /var/log/shiny-server \
	&& chown shiny:shiny /var/log/shiny-server \
	&& chown shiny:shiny -R /srv/shiny-server \
	&& chmod 755 -R /srv/shiny-server \
	&& chown shiny:shiny -R /opt/shiny-server/samples/sample-apps \
	&& chmod 755 -R /opt/shiny-server/samples/sample-apps

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir -p /var/log/supervisor \
	&& chmod 755 -R /var/log/supervisor

EXPOSE 8787 3838

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
