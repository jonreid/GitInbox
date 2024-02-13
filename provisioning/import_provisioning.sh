@ -1,27 +1,27 @@
#!/bin/sh

CERTIFICATE='provisioning/Certificates.p12'
PROVISIONING='provisioning/GitInbox_Distribution.mobileprovision'

# Decrypt the files
# --batch to prevent interactive command --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$PROVISIONING_PASSWORD" --output "$CERTIFICATE" "$CERTIFICATE".gpg
gpg --quiet --batch --yes --decrypt --passphrase="$PROVISIONING_PASSWORD" --output "$PROVISIONING" "$PROVISIONING".gpg

# Move provisioning profile into place
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
echo "-------------"
echo "List profiles:"
ls ~/Library/MobileDevice/Provisioning\ Profiles/
echo "-------------"
echo "Move profiles"
cp "$PROVISIONING" ~/Library/MobileDevice/Provisioning\ Profiles/
echo "-------------"
echo "List profiles:"
ls ~/Library/MobileDevice/Provisioning\ Profiles/

# Move certificate into keychain
security create-keychain -p "" build.keychain
security import "$CERTIFICATE" -t agg -k ~/Library/Keychains/build.keychain -P "$PROVISIONING_PASSWORD" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain
security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
