#!/bin/bash

xcodebuild archive -project GitInbox.xcodeproj -scheme GitInbox -sdk iphoneos -configuration Release -derivedDataPath DerivedData -archivePath DerivedData/Archive/GitOut
xcodebuild -exportArchive -archivePath DerivedData/Archive/GitOut.xcarchive -exportOptionsPlist provisioning/App-Store.plist -exportPath DerivedData/ipa
