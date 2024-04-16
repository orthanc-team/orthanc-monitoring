# Orthanc-prometheus

Based on the official `prom/prometheus` Docker image, here is an extra layer to allow the configuration of the scrap (Orthanc only) and remote write through environment variables.

## How it works?

A bash script will get the env var when the container starts and replace the placeholders in the `prometheus.yml` file.

Then, Prometheus will be started as usual.


## How to use it ?

Define these env vars:

- `DEPLOYMENT_NAME` (default: `unnamed_deployement`)
- `ORTHANC_SERVICE_NAME`  (default: `orthanc`)
- `ORTHANC_SERVICE_PORT`  (default: `8042`)
- `ORTHANC_USERNAME`  (default: `orthanc`)
- `ORTHANC_PASSWORD`  (default: `orthanc`)

- `REMOTE_WRITE_URL` (could be something  like `https://prometheus-something.grafana.net/api/prom/push`)
- `REMOTE_WRITE_USERNAME` (some sort of ID from Grafana.com)
- `REMOTE_WRITE_PASSWORD` (can be generated from Grafana.com)
