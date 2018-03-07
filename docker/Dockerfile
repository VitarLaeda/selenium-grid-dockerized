FROM netflixoss/java:8

#------------------------------------------------
# Customize sources for apt-get
#------------------------------------------------

RUN  mkdir -p /opt/selenium \
    && wget --no-verbose http://selenium-release.storage.googleapis.com/3.10/selenium-server-standalone-3.10.0.jar \
    -O /opt/selenium/selenium-server-standalone.jar

RUN useradd seluser --shell /bin/bash --create-home \
  && usermod -a -G sudo seluser \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'seluser:secret' | chpasswd

#------------------------
# Selenium Configuration
#------------------------

EXPOSE 4444
EXPOSE 5555

ENV GRID_NEW_SESSION_WAIT_TIMEOUT 0
ENV GRID_JETTY_MAX_THREADS -1
ENV GRID_NODE_POLLING  5000
ENV GRID_CLEAN_UP_CYCLE 5000
ENV GRID_TIMEOUT 30000
ENV GRID_BROWSER_TIMEOUT 60000
ENV GRID_MAX_SESSION 5
ENV GRID_UNREGISTER_IF_STILL_DOWN_AFTER 30000

COPY generate_config /opt/selenium/generate_config
COPY entry_point.sh /opt/bin/entry_point.sh
RUN chmod a+rx /opt/bin/entry_point.sh
RUN chmod a+rx /opt/selenium/generate_config

RUN chown -R seluser /opt/selenium

USER seluser

CMD ["/opt/bin/entry_point.sh"]