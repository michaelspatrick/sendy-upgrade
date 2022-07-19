#!/bin/sh

LICENSE="YOUR_LICENSE_HERE"
SENDY_DIR="/path/to/sendy"
HTML_DIR="html"

if [ "$(id -u)" != "0" ]; then
	echo "Sorry, you are not root."
	exit 1
fi

cd ${SENDY_DIR}

echo "Making a backup of existing Sendy installation..."
cp -r ${HTML_DIR} ${HTML_DIR}.old

echo "Downloading Sendy..."
wget https://sendy.co/download?license=${LICENSE} -O sendy.zip;

echo "Preparing installation..."
unzip sendy.zip;
cp -v ${HTML_DIR}/.htaccess sendy/.htaccess;
cp -v ${HTML_DIR}/includes/config.php sendy/includes/config.php;

echo "Transferring files to web directory..."
cp -Rv sendy/* ${HTML_DIR};

echo "Performing cleanup..."
rm sendy -drf;
rm sendy.zip -f;
chmod -R ugo-x,u+rwX,go+rX,go-w ${HTML_DIR}/;
