#!/bin/bash

# check if run as superuser
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

systemctl stop raspberrypi_exporter.timer
systemctl disable raspberrypi_exporter.timer
systemctl daemon-reload

rm -f "/storage/metrics/raspberrypi_exporter"

rm -f "/storage/.config/system.d/raspberrypi_exporter.service"
rm -f "/storage/.config/system.d/raspberrypi_exporter.timer"

rm -f "/storage/metrics/textfile_collector/raspberrypi-metrics.prom"
