#!/bin/sh

set -e

if [ -z "$IMAP_USERS" ]; then
    IMAP_USERS='imap:imap';
fi;

for USER in $IMAP_USERS; do
    USERNAME=$(echo $USER | awk '{split($1,array,":")} END {print array[1]}');
    PASSWORD=$(echo $USER | awk '{split($1,array,":")} END {print array[2]}');

    FOUND=$(getent passwd "$USERNAME" || echo '');
    if [ ! -z "$FOUND" ]; then
        echo "User $USERNAME already exists, so it is not created!";

        continue;
    fi;

    echo "Creating user $USERNAME...";
    adduser -D "$USERNAME";
    echo "$USERNAME:$PASSWORD" | chpasswd;
    if [ ! -d "/home/$USERNAME/Maildir" ]; then
        mkdir "/home/$USERNAME/Maildir";
        chown "$USERNAME" "/home/$USERNAME/Maildir";
    fi;
done;

exec dovecot -F;
