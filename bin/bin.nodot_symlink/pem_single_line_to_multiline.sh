#!/bin/bash

LF=$'\\\x0A'
#cat $1 | sed -e "s/-----BEGIN CERTIFICATE-----/&${LF}/" -e "s/-----END CERTIFICATE-----/${LF}&${LF}/" | sed -e "s/[^[:blank:]]\{64\}/&${LF}/g"
cat $1 | sed -e "s/[^[:blank:]]\{64\}/&${LF}/g"
