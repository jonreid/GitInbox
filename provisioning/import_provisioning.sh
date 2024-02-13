#!/bin/bash

CERTIFICATE='provisioning/Certificates.p12'
PROVISIONING='provisioning/GitInbox_Distribution.mobileprovision'

KEYCHAIN_PASSWORD=''

echo 'Decrypt the files'
# --batch to prevent interactive command, --yes to assume "yes" for questions
gpg --decrypt --quiet --batch --yes --passphrase="$PROVISIONING_PASSWORD" --output "$CERTIFICATE" "$CERTIFICATE".gpg
gpg --decrypt --quiet --batch --yes --passphrase="$PROVISIONING_PASSWORD" --output "$PROVISIONING" "$PROVISIONING".gpg

echo 'Move provisioning profile into place'
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp "$PROVISIONING" ~/Library/MobileDevice/Provisioning\ Profiles/
echo "List profiles:"
ls ~/Library/MobileDevice/Provisioning\ Profiles/

echo 'Move certificate into keychain'
security create-keychain -p "$KEYCHAIN_PASSWORD" build.keychain
security import "$CERTIFICATE" -t agg -k ~/Library/Keychains/build.keychain -P "$PROVISIONING_PASSWORD" -A
security list-keychains -d user -s ~/Library/Keychains/build.keychain

security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "$KEYCHAIN_PASSWORD" ~/Library/Keychains/build.keychain
security set-key-partition-list -S apple-tool:,apple: -s -k "$KEYCHAIN_PASSWORD" ~/Library/Keychains/build.keychain
