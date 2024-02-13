#!/bin/bash

CERTIFICATE="provisioning/Certificates.p12"
PROVISIONING="provisioning/GitInbox_Distribution.mobileprovision"

PROVISIONING_PATH="$HOME/Library/MobileDevice/Provisioning\ Profiles"
KEYCHAIN="$HOME/Library/Keychains/build.keychain"

echo "Decrypt the files"
# --batch to prevent interactive command --yes to assume "yes" for questions
gpg --decrypt --quiet --batch --yes --passphrase="$PROVISIONING_PASSWORD" --output "$CERTIFICATE" "$CERTIFICATE".gpg
gpg --decrypt --quiet --batch --yes --passphrase="$PROVISIONING_PASSWORD" --output "$PROVISIONING" "$PROVISIONING".gpg

echo "Move provisioning profile into place"
mkdir -p "$PROVISIONING_PATH"
cp $PROVISIONING "$PROVISIONING_PATH"
echo "List profiles:"
ls "$PROVISIONING_PATH"

echo "Move certificate into keychain"
security create-keychain -p '' build.keychain
security import "$CERTIFICATE" -t agg -k "$KEYCHAIN" -P "$PROVISIONING_PASSWORD" -A
security list-keychains -s "$KEYCHAIN"

security default-keychain -s "$KEYCHAIN"
security unlock-keychain -p '' "$KEYCHAIN"
security set-key-partition-list -S apple-tool:,apple: -s -k "" "$KEYCHAIN"
