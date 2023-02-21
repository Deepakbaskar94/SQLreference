sudo apt purge mysql-server*
sudo rm -r /etc/mysql /var/lib/mysql
sudo rm -r /var/log/mysql
sudo apt autoremove
sudo systemctl status mysql.service

