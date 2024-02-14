#!/bin/bash

PROJECT='GitInbox.xcodeproj'
SCHEME='GitInbox'
DESTINATION='platform=iOS Simulator,OS=latest,name=iPhone 15'

xcodebuild -showdestinations -project $PROJECT -scheme $SCHEME
set -o pipefail && \
  xcodebuild test -project $PROJECT -scheme $SCHEME -sdk iphonesimulator -destination "$DESTINATION" CODE_SIGNING_ALLOWED='NO' \
  | tee xcodebuild.log \
  | xcbeautify --renderer github-actions
