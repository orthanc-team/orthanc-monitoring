# Orthanc-monitoring

WARNING: This folder contains some old setup which was used for testing/exploration.

## Summary
Here is only a basic Orthanc with a Postgres.

But these 2 services, as well as the host system and the containers, are monitored thanks to Prometheus.
Grafana is also there to show the metrics.

## How it works

### Prometheus

Prometheus will collect the metrics from these sources:
- Orthanc ([link to official doc](https://book.orthanc-server.com/users/advanced-rest.html#instrumentation-with-prometheus))
- Node-exporter (allow to get the metrics from the system: CPU, RAM, disk space,...)
- Postgres (thanks to the exporter)
- CAdvisor (allow to get the metrics from the containers)

### Grafana

There is a predefined dashboard with all the metrics listed above.

## Misc
- There is a volume for the dashboard (Grafana container) so, if an update (with a new version of the dashboard) has to be made, the volume has to be deleted (otherwise, the dashboard will remain as it was)
