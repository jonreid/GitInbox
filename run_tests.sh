#!/bin/bash

set -o pipefail && xcodebuild test -project GitInbox.xcodeproj -scheme GitInbox -sdk iphonesimulator -destination "platform=iOS Simulator,OS=latest,name=iPhone 15" CODE_SIGNING_ALLOWED="NO" | tee xcodebuild.log | xcbeautify --renderer github-actions
