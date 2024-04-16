FROM prom/prometheus:v2.51.1

USER root
COPY ./entrypoint.sh /entrypoint.sh
COPY prometheus.yml /etc/prometheus/

RUN chmod +x /entrypoint.sh

USER nobody
ENTRYPOINT [ "/entrypoint.sh" ]