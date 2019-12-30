#!/bin/bash

curl -sL "https://github.com/ihomeautomate/raspberrypi_exporter/archive/master.zip" > "/tmp/raspberrypi_exporter.zip"
unzip -qq -o "/tmp/raspberrypi_exporter.zip" -d "/tmp"

mkdir -p "/storage/metrics/textfile_collector"

mv "/tmp/raspberrypi_exporter-master/raspberrypi_exporter" "/storage/metrics/"
chmod +x "/storage/metrics/raspberrypi_exporter"

mv "/tmp/raspberrypi_exporter-master/raspberrypi_exporter.service" "/storage/.config/system.d/"
mv "/tmp/raspberrypi_exporter-master/raspberrypi_exporter.timer" "/storage/.config/system.d/"

systemctl stop raspberrypi_exporter.timer
systemctl disable raspberrypi_exporter.timer

systemctl daemon-reload
systemctl enable raspberrypi_exporter.timer
systemctl start raspberrypi_exporter.timer

rm -f "/tmp/raspberrypi_exporter.zip"
rm -rf "/tmp/raspberrypi_exporter-master"
