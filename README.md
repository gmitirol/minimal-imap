Docker image for IMAP
=====================

Provides a minimal IMAP server docker image based on our [Alpine Linux 3.12 base image](https://github.com/gmitirol/alpine312) and Dovecot.

This image can be used to provide a simple IMAP server for testing and development.

By default, one IMAP user `imap` with the password `imap` is created.
This can be changed by setting the `IMAP_USERS` environment variable to a space-separated list
of `username:password` entries.
