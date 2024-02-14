#!/bin/bash

SCHEME='GitInbox'
DESTINATION='platform=iOS Simulator,OS=latest,name=iPhone 15'

xcodebuild test -scheme $SCHEME -sdk iphonesimulator -destination "$DESTINATION" -resultBundlePath TestResults CODE_SIGNING_ALLOWED='NO'
