ARG GRAFANA_IMAGE=grafana/grafana:latest
FROM ${GRAFANA_IMAGE}

USER root
RUN mkdir -p /etc/nginx/conf.d/ && \
    chown -R grafana /etc/nginx 

USER grafana
COPY datasources/* /etc/grafana/provisioning/datasources
COPY dashboards/* /etc/grafana/provisioning/dashboards

COPY default-http.conf /nginx-http.conf
RUN mkdir /etc/grafana/provisioning/dashboards/local

ADD entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]