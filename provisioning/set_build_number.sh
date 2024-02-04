#!/bin/sh

build=$(date -u +%Y.%m%d).$GITHUB_RUN_NUMBER
agvtool new-version -all "${build}"