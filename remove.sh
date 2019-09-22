if [ ! -d /etc/DirUtils ]; then
	echo "DirUtils not installed"
	exit 0
fi
rm -r /etc/DirUtils
x=`tail -1 /etc/bash.bashrc`
if [ "$x" = "source /etc/DirUtils/DirUtils.sh" ]; then
	sed -i '$ d' /etc/bash.bashrc
fi

echo "DirUtils removed successfully"
