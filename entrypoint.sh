#!/bin/bash
# if nginx configs, move to volume
mkdir -p /etc/nginx/conf.d/grafana
if [[ "$(ls -A /nginx)" ]]; then
    cp /nginx/* /etc/nginx/conf.d/grafana
else
    echo "ERROR: No nginx conf provided! Using default http config."
    cp /nginx-http.conf /etc/nginx/conf.d/grafana/nginx-http.conf
fi
/run.sh
