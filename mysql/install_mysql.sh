sudo apt update
sudo apt -y install mysql-server
sudo systemctl start mysql.service
sudo systemctl status mysql.service
#sudo mysql -u root -p password
#create user 'sammy'@'localhost'
cat << EOF | sudo mysql -uroot -ppassword
create database PP_MDM;
use PP_MDM;
create table devices (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  device_id varchar(64) NOT NULL,
  user_id int DEFAULT 0,
  org_id int DEFAULT 0,
  ser_no varchar(64) DEFAULT "",
  policy varchar(2048) DEFAULT "{}",
  created_at datetime DEFAULT now(),
  updated_at datetime DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);
create table org (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name varchar(64) NOT NULL,
  address varchar(512) DEFAULT "",
  mobile_number int(10) DEFAULT 0,
  email varchar(64) DEFAULT "",
  valid_till datetime,
  created_at datetime DEFAULT now(),
  updated_at datetime DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);
create table users (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  user_name varchar(32) NOT NULL UNIQUE,
  password varchar(64) DEFAULT "",
  first_name varchar(64) DEFAULT "",
  last_name varchar(64) DEFAULT "",
  mobile_number int(10) DEFAULT 0,
  country_code int(3) DEFAULT 0,
  email varchar(64) DEFAULT "",
  sup_id int DEFAULT 0, 
  org_id int DEFAULT 0,
  role int DEFAULT 3,
  policy varchar(2048) DEFAULT "{}",
  created_at datetime DEFAULT now(),
  updated_at datetime DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  FOREIGN KEY (sup_id) REFERENCES users(id),
  FOREIGN KEY (org_id) REFERENCES org(id)
);
EOF
