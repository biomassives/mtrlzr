#!/usr/bin/env bash

# WARNING: This script will be executed as the "admin" user.
# If you want to run it as another user, use su/sudo.

cd /var/www/webapp/src

sudo setfacl -R -d -m u:admin:rwx ./web/assets ./runtime
sudo setfacl -R -d -m g:www-data:rwx ./web/assets ./runtime
sudo setfacl -R -d -m o::r-x ./web/assets ./runtime

sudo setfacl -R -m u:admin:rwx ./web/assets ./runtime
sudo setfacl -R -m g:www-data:rwx ./web/assets ./runtime
sudo setfacl -R -m o::r-x ./web/assets ./runtime

# Install some dependencies
yarn install

# Run the app
pm2 start ./bin/www