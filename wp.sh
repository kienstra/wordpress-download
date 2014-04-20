#!/bin/bash

# modified from https://gist.github.com/3278562.git
#download wordpress
curl -O http://wordpress.org/latest.tar.gz
#unzip wordpress
tar -zxvf latest.tar.gz
#change dir to wordpress
cd wordpress
#copy file to parent dir
cp -rf . ..
#move back to parent dir
cd ..
#remove files from wordpress folder
rm -R wordpress
#create wp config
mkdir wp-content/uploads
#remove zip file
rm latest.tar.gz

cp wp-config-sample.php wp-config.php
rm -f wp-config-sample.php

touch .htaccess
echo "<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /wp/
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /wp/index.php [L]
</IfModule> " > .htaccess

#create gitignore file
wget http://wpengine.staging.wpengine.com/wp-content/uploads/2013/10/recommended-gitignore-no-wp.txt -O .gitignore

git init
git add .
git commit -am 'first commit'

