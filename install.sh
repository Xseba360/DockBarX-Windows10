#!/bin/sh
dir=/usr/share/dockbarx/themes
targz=win10
echo "The default install directory is $dir. Would you like to change it? [Y/n]"
read a
case $a in

		[yY] | [yY][Ee][Ss] )
			echo "Please enter install directory for the theme."
			echo -n "[$dir]"
			read newdir
			if [ -z $newdir ]; then
				echo "Leaving install directory unchanged."
			else
				dir=$newdir
			fi
			;;

		[nN] | [n|N][O|o] )
			echo "Leaving install directory unchanged."
			;;
		*) 
			echo "Invalid input"
			exit 1
			;;
esac

echo "The default theme filename is $targz. Would you like to change it? [Y/n]"
read b
case $b in

		[yY] | [yY][Ee][Ss] )
			echo "Please enter theme filename for the theme."
			echo -n "[$targz]"
			read newtargz
			if [ -z $newtargz ]; then
				echo "Leaving theme filename unchanged."
			else
				targz=$newtargz
			fi
			;;

		[nN] | [n|N][O|o] )
			echo "Leaving theme filename unchanged."
			;;
		*) 
			echo "Invalid input"
			exit 1
			;;
esac

echo "Do you want to install the theme file ($targz.tar.gz) to $dir now (need to be root)? [Y/n]"
read c
case $c in

		[yY] | [yY][Ee][Ss] )
			tar -czf $targz.tar.gz pixmaps info config && echo 'Archive created' && cp $targz.tar.gz $dir && echo "Archive installed";;
		[nN] | [n|N][O|o] )
			tar -czf $targz.tar.gz pixmaps info config && echo 'Archive created';;
		*) 
			echo "Invalid input"
			exit 1
			;;
esac
echo Done.