ARG GRAFANA_VERSION=9.3.6
FROM grafana/grafana:${GRAFANA_VERSION}

USER root
RUN apk add postgresql-client

USER grafana
COPY datasources/* /etc/grafana/provisioning/datasources
COPY dashboards/* /etc/grafana/provisioning/dashboards

COPY default-http.conf /nginx-http.conf
RUN mkdir /etc/grafana/provisioning/dashboards/local

ADD entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]