#!/bin/sh

# Set environment variables default values if needed
DEPLOYMENT_NAME="${DEPLOYMENT_NAME:-unnamed_deployement}"

ORTHANC_SERVICE_NAME="${ORTHANC_SERVICE_NAME:-orthanc}"
ORTHANC_SERVICE_PORT="${ORTHANC_SERVICE_PORT:-8042}"
ORTHANC_USERNAME="${ORTHANC_USERNAME:-orthanc}"
ORTHANC_PASSWORD="${ORTHANC_PASSWORD:-orthanc}"

# Replace placeholders with environment variable values
sed -i "s/\$DEPLOYMENT_NAME/$DEPLOYMENT_NAME/g" /etc/prometheus/prometheus.yml

# Espace slashes from URL
escaped_remote_write_url=$(echo "$REMOTE_WRITE_URL" | sed 's/\//\\\//g') && sed -i "s/\$REMOTE_WRITE_URL/$escaped_remote_write_url/g" /etc/prometheus/prometheus.yml
sed -i "s/\$REMOTE_WRITE_USERNAME/$REMOTE_WRITE_USERNAME/g" /etc/prometheus/prometheus.yml
sed -i "s/\$REMOTE_WRITE_PASSWORD/$REMOTE_WRITE_PASSWORD/g" /etc/prometheus/prometheus.yml

sed -i "s/\$ORTHANC_SERVICE_NAME/$ORTHANC_SERVICE_NAME/g" /etc/prometheus/prometheus.yml
sed -i "s/\$ORTHANC_SERVICE_PORT/$ORTHANC_SERVICE_PORT/g" /etc/prometheus/prometheus.yml
sed -i "s/\$ORTHANC_USERNAME/$ORTHANC_USERNAME/g" /etc/prometheus/prometheus.yml
sed -i "s/\$ORTHANC_PASSWORD/$ORTHANC_PASSWORD/g" /etc/prometheus/prometheus.yml


## call original prometheus entrypoint
/bin/prometheus --config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/prometheus --web.console.libraries=/usr/share/prometheus/console_libraries --web.console.templates=/usr/share/prometheus/consoles