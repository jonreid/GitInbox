#!/bin/bash

xcodebuild test -project GitInbox.xcodeproj -scheme GitInbox -sdk iphonesimulator -destination "platform=iOS Simulator,OS=latest,name=iPhone 15"
