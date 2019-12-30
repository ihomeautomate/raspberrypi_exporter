#!/bin/bash

systemctl stop raspberrypi_exporter.timer
systemctl disable raspberrypi_exporter.timer
systemctl daemon-reload

rm -f "/storage/metrics/raspberrypi_exporter"

rm -f "/storage/.config/system.d/raspberrypi_exporter.service"
rm -f "/storage/.config/system.d/raspberrypi_exporter.timer"

rm -f "/storage/metrics/textfile_collector/raspberrypi-metrics.prom"
