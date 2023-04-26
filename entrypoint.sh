#!/bin/sh
set -e
systemctl start ssh
exec gunicorn -w 4 -b 0.0.0.0:8000 app:app