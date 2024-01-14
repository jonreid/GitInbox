#!/bin/bash

xcodebuild archive -project GitInbox.xcodeproj -scheme GitInbox -sdk iphoneos -configuration Release -derivedDataPath DerivedData -archivePath DerivedData/Archive/GitOut
