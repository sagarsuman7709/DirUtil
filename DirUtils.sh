DIR_FILE=/etc/DirUtils/.dir.db
chd()
{
        FOUND=false
	if [ "$#" -ne 1 ]; then
		echo "Usage: chd VARIABLE" >&2
		return 0
	fi
        if [ ! -f "$DIR_FILE" ]; then
                echo "desired path not stored"
                return 0
        fi
        while read i;
        do
                x=`echo "$i" | cut -d' '  -f1`
                if [[ $x == "$1" ]]; then
                        FOUND=true
                        y=`echo "$i" | cut -d' '  -f2`
                        cd $y
                        break
                fi
        done < $DIR_FILE
        if [ $FOUND = false ]; then
                echo "specified variable not found">&2
        fi
}      

prd()
{
        FOUND=false
	if [ "$#" -ne 1 ]; then
		echo "Usage: prd VARIABLE" >&2
		return 0
	fi
        if [ ! -f "$DIR_FILE" ]; then
                echo "desired path not stored"
                return 0
        fi
        while read i;
        do
                x=`echo "$i" | cut -d' '  -f1`
                if [[ $x == "$1" ]]; then
                        FOUND=true
                        y=`echo "$i" | cut -d' '  -f2`
                        echo $y
                        break
                fi
        done < $DIR_FILE
        if [ $FOUND = false ]; then
                echo "specified variable not found">&2
        fi
}

std()
{
	if [ "$#" -ne 1 ]; then
		echo "Usage: stdr VARIABLE" >&2
		return 0
	fi
	
        CUR_DIR=`pwd`
        FOUND=false
        while read i;
        do
                x=`echo "$i" | cut -d' ' -f1`
                if [[ $x == "$1" ]]; then
                        FOUND=true
                        sed -i "s~$i~$x $CUR_DIR~g" $DIR_FILE
                fi
        done < $DIR_FILE
        if [ $FOUND = false ]; then
                echo "$1 $CUR_DIR" >> $DIR_FILE
        fi
}

cld()
{
	cat /dev/null > $DIR_FILE
}	

lsd()
{
	printf 'Variable%-13spath stored\n' 
	printf '================================\n' 
	while read i;
	do
		x=`echo "$i" | cut -d' ' -f1`
		y=`echo "$i" | cut -d' ' -f2`
		printf '%-20s%s\n' "$x" "$y"
	done < $DIR_FILE
}
