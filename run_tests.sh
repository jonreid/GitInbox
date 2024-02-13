#!/bin/bash

xcodebuild test -project GitInbox.xcodeproj -scheme GitInbox -sdk iphonesimulator -destination "platform=iOS Simulator,OS=latest,name=iPhone 15" CODE_SIGNING_ALLOWED="NO" | xcbeautify --renderer github-actions && exit ${PIPESTATUS[0]}
