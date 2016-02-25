#!/bin/sh

ERROR=0


txtgrn=$(tput setaf 2) # Green
txtylw=$(tput setaf 3) # Yellow
txtblu=$(tput setaf 4) # Blue
txtpur=$(tput setaf 5) # Purple
txtcyn=$(tput setaf 6) # Cyan
txtwht=$(tput setaf 7) # White
txtrst=$(tput sgr0) # Text reset.


echo "##########################################################################################"
echo "#"
echo "#  2.  C H E C K I N G   O U T P U T   F I L E S / F O L D E R S"
echo "#"
echo "##########################################################################################"



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.1 \$DUMP_PATH"
echo "-"
echo "--------------------------------------------------------------------------------"
echo
echo "----------------------------------------"
echo " 2.1.1 #DUMP_PATH=\"\${_INSTALL_PREFIX}/var/mysqldump-secure/\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_PATH/#DUMP_PATH/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo

echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && { echo "${txtpur}===> [FAIL] Unexpected OK${txtrst}"; ERROR=1; } || echo "${txtgrn}===> [OK] Expected Error. Exit code: $?${txtrst}"
sudo sed -i'' 's/#DUMP_PATH/DUMP_PATH/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.1.2 DUMP_PATH=\"\${_INSTALL_PREFIX}/var/mysqldump-secure/dir1/dir2\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/var\/mysqldump-secure/var\/mysqldump-secure\/dir1\/dir2/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo

echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/var\/mysqldump-secure\/dir1\/dir2/var\/mysqldump-secure/' /etc/mysqldump-secure.conf
sudo rm -rf /var/mysqldump-secure/dir1/dir2



echo
echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.2 \$DUMP_DIR_CHMOD"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 2.2.1 #DUMP_DIR_CHMOD=\"0700\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_DIR_CHMOD="0700"/#DUMP_DIR_CHMOD="0700"/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo

echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/#DUMP_DIR_CHMOD="0700"/DUMP_DIR_CHMOD="0700"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.2.2 DUMP_DIR_CHMOD=\"0700a\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_DIR_CHMOD="0700"/DUMP_DIR_CHMOD="0700a"/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo

echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/DUMP_DIR_CHMOD="0700a"/DUMP_DIR_CHMOD="0700"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.2.3 DUMP_DIR_CHMOD=\"abc\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_DIR_CHMOD="0700"/DUMP_DIR_CHMOD="abc"/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo

echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/DUMP_DIR_CHMOD="abc"/DUMP_DIR_CHMOD="0700"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.2.4 DUMP_DIR_CHMOD=\"\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_DIR_CHMOD="0700"/DUMP_DIR_CHMOD=""/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo

echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/DUMP_DIR_CHMOD=""/DUMP_DIR_CHMOD="0700"/' /etc/mysqldump-secure.conf



echo
echo
echo "--------------------------------------------------------------------------------"
echo "-"
echo "-  2.3 \$DUMP_FILE_CHMOD"
echo "-"
echo "--------------------------------------------------------------------------------"

echo
echo "----------------------------------------"
echo " 2.3.1 #DUMP_FILE_CHMOD=\"0400\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_FILE_CHMOD="0400"/#DUMP_FILE_CHMOD="0400"/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo

echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/#DUMP_FILE_CHMOD="0400"/DUMP_FILE_CHMOD="0400"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.3.2 DUMP_FILE_CHMOD=\"0400a\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_FILE_CHMOD="0400"/DUMP_FILE_CHMOD="0400a"/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo

echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/DUMP_FILE_CHMOD="0400a"/DUMP_FILE_CHMOD="0400"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.3.3 DUMP_FILE_CHMOD=\"abc\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_FILE_CHMOD="0400"/DUMP_FILE_CHMOD="abc"/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo

echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/DUMP_FILE_CHMOD="abc"/DUMP_FILE_CHMOD="0400"/' /etc/mysqldump-secure.conf


echo
echo "----------------------------------------"
echo " 2.3.4 DUMP_FILE_CHMOD=\"\""
echo "----------------------------------------"
echo
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
sudo sed -i'' 's/DUMP_FILE_CHMOD="0400"/DUMP_FILE_CHMOD=""/' /etc/mysqldump-secure.conf

echo "\$ sudo mysqldump-secure --cron"
sudo mysqldump-secure --cron && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo rm -rf /var/mysqldump-secure/ && sudo mkdir -p /var/mysqldump-secure/ && sudo chmod 0700 /var/mysqldump-secure/
echo

echo "\$ sudo mysqldump-secure --verbose"
sudo mysqldump-secure --verbose && echo "${txtgrn}===> [OK] Success${txtrst}" || { echo "${txtpur}===> [FAIL] Unexpected exit code: $?${txtrst}"; ERROR=1; }
sudo sed -i'' 's/DUMP_FILE_CHMOD=""/DUMP_FILE_CHMOD="0400"/' /etc/mysqldump-secure.conf



exit $ERROR