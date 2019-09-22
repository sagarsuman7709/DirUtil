mkdir -p /etc/DirUtils
cp ./DirUtils.sh /etc/DirUtils
touch /etc/DirUtils/.dir.db
chmod 666 /etc/DirUtils/.dir.db
echo "source /etc/DirUtils/DirUtils.sh" >> /etc/bash.bashrc
