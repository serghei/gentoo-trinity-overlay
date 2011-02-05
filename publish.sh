#!/bin/bash

rsync -avR --progress --exclude '.git' --exclude 'publish.sh' . ice:/home/serghei/www/thel.ro/htdocs/overlay
