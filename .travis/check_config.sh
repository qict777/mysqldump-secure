#!/bin/sh

ERROR=0


echo "##########################################################################################"
echo "#"
echo "#  2.  C H E C K I N G   C O N F I G U R A T I O N   F I L E"
echo "#"
echo "##########################################################################################"


echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.1 Output files/folders"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 2.1.1 \$DUMP_PATH"
echo "----------------------------------------"

echo
echo "a) #DUMP_PATH=\"\${_INSTALL_PREFIX}/var/mysqldump-secure/\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_PATH/#DUMP_PATH/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/#DUMP_PATH/DUMP_PATH/' /etc/mysqldump-secure.conf

echo
echo "b) DUMP_PATH=\"\${_INSTALL_PREFIX}/var/mysqldump-secure/dir1/dir2\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/var\/mysqldump-secure/var\/mysqldump-secure\/dir1\/dir2/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/var\/mysqldump-secure\/dir1\/dir2/var\/mysqldump-secure/' /etc/mysqldump-secure.conf
sudo rm -rf /var/mysqldump-secure/dir1/dir2



echo
echo "----------------------------------------"
echo " 2.1.2 \$DUMP_DIR_CHMOD"
echo "----------------------------------------"

echo
echo "a) #DUMP_DIR_CHMOD=\"0700\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_DIR_CHMOD="0700"/#DUMP_DIR_CHMOD="0700"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/#DUMP_DIR_CHMOD="0700"/DUMP_DIR_CHMOD="0700"/' /etc/mysqldump-secure.conf

echo
echo "b) DUMP_DIR_CHMOD=\"0700a\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_DIR_CHMOD="0700"/DUMP_DIR_CHMOD="0700a"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/DUMP_DIR_CHMOD="0700a"/DUMP_DIR_CHMOD="0700"/' /etc/mysqldump-secure.conf

echo
echo "c) DUMP_DIR_CHMOD=\"\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_DIR_CHMOD="0700"/DUMP_DIR_CHMOD=""/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/DUMP_DIR_CHMOD=""/DUMP_DIR_CHMOD="0700"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.1.3 \$DUMP_FILE_CHMOD"
echo "----------------------------------------"

echo
echo "a) #DUMP_FILE_CHMOD=\"0400\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_FILE_CHMOD="0400"/#DUMP_FILE_CHMOD="0400"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/#DUMP_FILE_CHMOD="0400"/DUMP_FILE_CHMOD="0400"/' /etc/mysqldump-secure.conf

echo
echo "b) DUMP_FILE_CHMOD=\"0400a\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_FILE_CHMOD="0400"/DUMP_FILE_CHMOD="0400a"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/DUMP_FILE_CHMOD="0400a"/DUMP_FILE_CHMOD="0400"/' /etc/mysqldump-secure.conf

echo
echo "c) DUMP_FILE_CHMOD=\"\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_FILE_CHMOD="0400"/DUMP_FILE_CHMOD=""/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/DUMP_FILE_CHMOD=""/DUMP_FILE_CHMOD="0400"/' /etc/mysqldump-secure.conf



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.2 MySQL Connection settings"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 2.2.1 \$MYSQL_CNF_FILE"
echo "----------------------------------------"

echo
echo "a) #MYSQL_CNF_FILE=\"/etc/mysqldump-secure.cnf\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_CNF_FILE/#MYSQL_CNF_FILE/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/#MYSQL_CNF_FILE/MYSQL_CNF_FILE/' /etc/mysqldump-secure.conf

echo
echo "b) #MYSQL_CNF_FILE=\"/etc/mysqldump-secure.cnf2\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/mysqldump-secure.cnf/mysqldump-secure.cnf2/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/mysqldump-secure.cnf2/mysqldump-secure.cnf/' /etc/mysqldump-secure.conf

echo
echo "c) #MYSQL_CNF_FILE=\"\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_CNF_FILE="\/etc\/mysqldump-secure.cnf"/MYSQL_CNF_FILE=""/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/MYSQL_CNF_FILE=""/MYSQL_CNF_FILE="\/etc\/mysqldump-secure.cnf"/' /etc/mysqldump-secure.conf



echo
echo "----------------------------------------"
echo " 2.2.2 \$MYSQL_SSL_ENABLE"
echo "----------------------------------------"

echo
echo "a) #MYSQL_SSL_ENABLE"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_SSL_ENABLE/#MYSQL_SSL_ENABLE/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/#MYSQL_SSL_ENABLE/MYSQL_SSL_ENABLE/' /etc/mysqldump-secure.conf

echo
echo "b) MYSQL_SSL_ENABLE=2"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_SSL_ENABLE=1/MYSQL_SSL_ENABLE=2/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/MYSQL_SSL_ENABLE=2/MYSQL_SSL_ENABLE=1/' /etc/mysqldump-secure.conf

echo
echo "c) MYSQL_SSL_ENABLE="
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_SSL_ENABLE=1/MYSQL_SSL_ENABLE=/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/MYSQL_SSL_ENABLE=/MYSQL_SSL_ENABLE=1/' /etc/mysqldump-secure.conf



echo
echo "----------------------------------------"
echo " 2.2.3 \$MYSQL_SSL_CA_PEM"
echo "----------------------------------------"

echo
echo "a) #MYSQL_SSL_CA_PEM"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_SSL_CA_PEM/#MYSQL_SSL_CA_PEM/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/#MYSQL_SSL_CA_PEM/MYSQL_SSL_CA_PEM/' /etc/mysqldump-secure.conf

echo
echo "b) ca.pem.notfound"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/ca.pem/ca.pem.notfound/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK. Exit code: $?"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/ca.pem.notfound/ca.pem/' /etc/mysqldump-secure.conf

  # 9.f [ABORT] $MYSQL_SSL_CLIENT_CERT_PEM
  # TODO:
  #- echo "---------- \$MYSQL_SSL_CLIENT_CERT_PEM ----------"
  #- sudo sed -i'' 's/MYSQL_SSL_CLIENT_CERT_PEM/#MYSQL_SSL_CLIENT_CERT_PEM/' /etc/mysqldump-secure.conf
  #- sudo mysqldump-secure --cron
  #- sudo mysqldump-secure
  #- sudo sed -i'' 's/#MYSQL_SSL_CLIENT_CERT_PEM/MYSQL_SSL_CLIENT_CERT_PEM/' /etc/mysqldump-secure.conf

  #- echo "---------- \$MYSQL_SSL_CLIENT_CERT_PEM ----------"
  #- sudo sed -i'' 's/client-cert.pem/client-cert.pem2/' /etc/mysqldump-secure.conf
  #- sudo mysqldump-secure --cron
  #- sudo mysqldump-secure
  #- sudo sed -i'' 's/client-cert.pem2/client-cert.pem/' /etc/mysqldump-secure.conf


  # 9.g [ABORT] $MYSQL_SSL_CLIENT_KEY_PEM
  # TODO:
  #- echo "---------- \$MYSQL_SSL_CLIENT_KEY_PEM ----------"
  #- sudo sed -i'' 's/MYSQL_SSL_CLIENT_KEY_PEM/#MYSQL_SSL_CLIENT_KEY_PEM/' /etc/mysqldump-secure.conf
  #- sudo mysqldump-secure --cron
  #- sudo mysqldump-secure
  #- sudo sed -i'' 's/#MYSQL_SSL_CLIENT_KEY_PEM/MYSQL_SSL_CLIENT_KEY_PEM/' /etc/mysqldump-secure.conf

  #- echo "---------- \$MYSQL_SSL_CLIENT_KEY_PEM ----------"
  #- sudo sed -i'' 's/client-key.pem/client-key.pem2/' /etc/mysqldump-secure.conf
  #- sudo mysqldump-secure --cron
  #- sudo mysqldump-secure
  #- sudo sed -i'' 's/client-key.pem2/client-key.pem/' /etc/mysqldump-secure.conf



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.3 MySQL Dump settings"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 2.3.1 \$MYSQL_OPTS"
echo "----------------------------------------"

echo
echo "a) #MYSQL_OPTS"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/MYSQL_OPTS/#MYSQL_OPTS/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/#MYSQL_OPTS/MYSQL_OPTS/' /etc/mysqldump-secure.conf

echo
echo "b) --opt2"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/ --opt/ --opt2/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK. Exit code: $?"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK. Exit code: $?"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/ --opt2/ --opt/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.3.2 \$IGNORE"
echo "----------------------------------------"

echo
echo "a) #IGNORE=\"information_schema performance_schema\" (dumping performance_schema, which is a virtual db and requires --skip-events)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^IGNORE/#IGNORE/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK. Exit code: $?"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK. Exit code: $?"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/^#IGNORE/IGNORE/' /etc/mysqldump-secure.conf

echo
echo "b) IGNORE=\"\" (dumping performance_schema, which is a virtual db and requires --skip-events)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/IGNORE="information_schema performance_schema"/IGNORE=""/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK. Exit code: $?"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK. Exit code: $?"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/IGNORE=""/IGNORE="information_schema performance_schema"/' /etc/mysqldump-secure.conf

echo
echo "c) IGNORE= (dumping performance_schema, which is a virtual db and requires --skip-events)"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/IGNORE="information_schema performance_schema"/IGNORE=/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK. Exit code: $?"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK. Exit code: $?"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/IGNORE=/IGNORE="information_schema performance_schema"/' /etc/mysqldump-secure.conf


echo
echo "d) IGNORE=\"notfound performance_schema\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/IGNORE="information_schema performance_schema"/IGNORE="notfound performance_schema"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/IGNORE="notfound performance_schema"/IGNORE="information_schema performance_schema"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.3.3 \$REQUIRE"
echo "----------------------------------------"

echo
echo "a) #REQUIRE=\"mysql\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^REQUIRE/#REQUIRE/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^#REQUIRE/REQUIRE/' /etc/mysqldump-secure.conf

echo
echo "b) REQUIRE=\"\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/REQUIRE="mysql"/REQUIRE=""/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/REQUIRE=""/REQUIRE="mysql"/' /etc/mysqldump-secure.conf

echo
echo "c) REQUIRE="
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/REQUIRE="mysql"/REQUIRE=/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/REQUIRE=/REQUIRE="mysql"/' /etc/mysqldump-secure.conf


echo
echo "d) REQUIRE=\"notfound\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/REQUIRE="mysql"/REQUIRE="notfound"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "--> [FAIL] Unexpected OK. Exit code: $?"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && { echo "--> [FAIL] Unexpected OK. Exit code: $?"; ERROR=1; } || echo "--> [OK] Expected Error. Exit code: $?"
sudo sed -i'' 's/REQUIRE="notfound"/REQUIRE="mysql"/' /etc/mysqldump-secure.conf




echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.4 (OPT) Logging"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 2.4.1 \$LOG"
echo "----------------------------------------"

echo
echo "a) #LOG=1"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG=1/#LOG=1/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^#LOG=1/LOG=1/' /etc/mysqldump-secure.conf

echo
echo "b) LOG=2"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG=1/LOG=2/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^LOG=2/LOG=1/' /etc/mysqldump-secure.conf

echo
echo "c) LOG=\"wrong\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG=1/LOG="wrong"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^LOG="wrong"/LOG=1/' /etc/mysqldump-secure.conf



echo
echo "----------------------------------------"
echo " 2.4.2 \$LOG_CHMOD"
echo "----------------------------------------"

echo
echo "a) #LOG_CHMOD=\"0600\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG_CHMOD/#LOG_CHMOD/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^#LOG_CHMOD/LOG_CHMOD/' /etc/mysqldump-secure.conf

echo
echo "b) LOG_CHMOD=\"abc\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOG_CHMOD="0600"/LOG_CHMOD="abc"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/LOG_CHMOD="abc"/LOG_CHMOD="0600"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.4.3 \$LOGFILE"
echo "----------------------------------------"

echo
echo "a) #LOGFILE=\"/var/log/mysqldump-secure.log\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^LOGFILE/#LOGFILE/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^#LOGFILE/LOGFILE/' /etc/mysqldump-secure.conf

echo
echo "b) LOGFILE=\"/var/log/mysqldump-secure.log2\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/mysqldump-secure.log/mysqldump-secure.log2/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo rm /var/log/mysqldump-secure.log2
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/mysqldump-secure.log2/mysqldump-secure.log/' /etc/mysqldump-secure.conf

echo
echo "c) LOGFILE=\"/var/log/dir1/dir2/mysqldump-secure.log\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/mysqldump-secure.log/\/dir1\/dir2\/mysqldump-secure.log/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo rm -rf /var/log/dir1/dir2/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/\/dir1\/dir2\/mysqldump-secure.log/mysqldump-secure.log/' /etc/mysqldump-secure.conf
sudo rm -rf /var/log/dir1/dir2/



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.5 (OPT) Compression"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 2.5.1 \$COMPRESS"
echo "----------------------------------------"

echo
echo "a) #COMPRESS=1"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS=1/#COMPRESS=1/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^#COMPRESS=1/COMPRESS=1/' /etc/mysqldump-secure.conf

echo
echo "b) COMPRESS=2"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS=1/COMPRESS=2/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS=2/COMPRESS=1/' /etc/mysqldump-secure.conf

echo
echo "c) COMPRESS=\"wrong\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS=1/COMPRESS="wrong"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS="wrong"/COMPRESS=1/' /etc/mysqldump-secure.conf

echo
echo "d) COMPRESS=\"\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS=1/COMPRESS=""/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS=""/COMPRESS=1/' /etc/mysqldump-secure.conf

echo
echo "e) COMPRESS="
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS=1/COMPRESS=/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS=/COMPRESS=1/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.5.2 \$COMPRESS_BIN"
echo "----------------------------------------"

echo
echo "a) #COMPRESS_BIN=\"gzip\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_BIN/#COMPRESS_BIN/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^#COMPRESS_BIN/COMPRESS_BIN/' /etc/mysqldump-secure.conf

echo
echo "b) COMPRESS_BIN=\"\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_BIN="gzip"/COMPRESS_BIN=""/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS_BIN=""/COMPRESS_BIN="gzip"/' /etc/mysqldump-secure.conf

echo
echo "c) COMPRESS_BIN="
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_BIN="gzip"/COMPRESS_BIN=/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS_BIN=/COMPRESS_BIN="gzip"/' /etc/mysqldump-secure.conf

echo
echo "d) COMPRESS_BIN=\"wrong\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_BIN="gzip"/COMPRESS_BIN="wrong"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS_BIN="wrong"/COMPRESS_BIN="gzip"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.5.3 \$COMPRESS_ARG"
echo "----------------------------------------"

echo
echo "a) #COMPRESS_ARG=\"-9 --stdout\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_ARG/#COMPRESS_ARG/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^#COMPRESS_ARG/COMPRESS_ARG/' /etc/mysqldump-secure.conf

echo
echo "b) COMPRESS_ARG=\"\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_ARG="-9 --stdout"/COMPRESS_ARG=""/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS_ARG=""/COMPRESS_ARG="-9 --stdout"/' /etc/mysqldump-secure.conf

echo
echo "c) COMPRESS_ARG="
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_ARG="-9 --stdout"/COMPRESS_ARG=/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS_ARG=/COMPRESS_ARG="-9 --stdout"/' /etc/mysqldump-secure.conf

echo
echo "d) COMPRESS_ARG=\"wrong\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_ARG="-9 --stdout"/COMPRESS_ARG="wrong"/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS_ARG="wrong"/COMPRESS_ARG="-9 --stdout"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.5.4 \$COMPRESS_EXT"
echo "----------------------------------------"

echo
echo "a) #COMPRESS_EXT=\"gz\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_EXT/#COMPRESS_EXT/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS_EXT/COMPRESS_EXT/' /etc/mysqldump-secure.conf

echo
echo "b) COMPRESS_EXT=\"\""
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_EXT="gz"/COMPRESS_EXT=""/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS_EXT=""/COMPRESS_EXT="gz"/' /etc/mysqldump-secure.conf

echo
echo "c) COMPRESS_EXT="
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/^COMPRESS_EXT="gz"/COMPRESS_EXT=/' /etc/mysqldump-secure.conf
echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo
echo "\$ sudo mysqldump-secure"
sudo mysqldump-secure && echo "--> [OK] Expected" || { echo "--> [FAIL] Unexpected exit code: $?"; ERROR=1; }
sudo sed -i'' 's/^COMPRESS_EXT=/COMPRESS_EXT="gz"/' /etc/mysqldump-secure.conf


exit $ERROR
