#!/bin/bash

magentoTar=/var/www/Magento-CE-2.1.2_sample_data-2016-10-11-11-31-40.tar.bz2
htmlDestDir=/var/www/html

# check variable htmlDestDir not empty
if [ -z ${htmlDestDir} ]; then
    echo "htmlDestDir not set!! It's dangerous!!"
    exit
fi

# clear htmlDestDir
echo "clearing $htmlDestDir..."
sudo rm -rf $htmlDestDir/*
sudo rm -rf $htmlDestDir/.*
echo "$htmlDestDir cleared"

# unzip magento tar to /var/www/html
echo "unzip $magentoTar to $htmlDestDir"
sudo tar -xf $magentoTar -C $htmlDestDir
sudo chown www-data:www-data -R $htmlDestDir/*
sudo chown www-data:www-data -R $htmlDestDir/.*
echo "unzip completed"

# clear database
for i in {1..5}
do
    echo "clear database #$i"
    mysql -s -hlocalhost -umagento -pmagento information_schema -e "select concat('drop tables ', table_name, ';') from tables where table_schema='magento'" | mysql -f -hlocalhost -umagento -pmagento magento
done
