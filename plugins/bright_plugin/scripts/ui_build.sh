#!/bin/bash

set -eE

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash
apt-get update && apt-get install -y nodejs

UI_SRC_PATH=/opt/ufm/ufm_plugin_bright/bright_plugin/src/bright-ui
OUTPUT_PATH=/opt/ufm/ufm_plugin_bright/bright_plugin/bright_ui
cd ${UI_SRC_PATH} ; \
npm install --force; \
node node_modules/@angular/cli/bin/ng build --output-path=${OUTPUT_PATH} ; \
apt-get -y purge nodejs; \
apt-get -y autoremove

rm -rf ${UI_SRC_PATH}

exit 0