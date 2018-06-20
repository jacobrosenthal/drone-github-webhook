#!/bin/sh

curl -X POST -H "Content-Type: application/json" -H "Authorization: token ${GITHUB_TOKEN}" -d @${PLUGIN_JSON} ${PLUGIN_URL} 
