#!/bin/bash
# function
func_customks()
{
while true
do
read -p "Do you have any custom ks file for this provisioning? yes/no [no]: " customks

default="$(grep -e default /var/lib/tftpboot/pxelinux.cfg/default)"
ks_path=""

if [[ $default == "default 1" ]];
then
        ks_path="/var/www/html/ks/rhel7ks.cfg"

elif [[ $default == "default 2" ]];
then
        ks_path="/var/www/html/ks/rhel8ks.cfg"

elif [[ $default == "default 3" ]];
then
        ks_path="/var/www/html/ks/vmw6ks.cfg"

elif [[ $default == "default 4" ]];
then
        ks_path="/var/www/html/ks/vmw7ks.cfg"

elif [[ $default == "default 5" ]];
then
        ks_path="/var/www/html/ks/ubuntu2004.cfg"

fi

if [ -z "$customks" ];
then
customks="no"
fi

if [ $customks == "y" ] || [ $customks == "yes" ];
then
        read -p "Please find path of the file: [ex: /opt/rhel78.cfg] : " filepathks
	echo "Applying New Custom Script.."
	sleep 2
	cp -f $filepathks $ks_path
	if [ $? == 0 ] ; then
  		echo "Applying custom script Successfull"
	else 
  		echo "Applying custom script Failed"
	fi
        read -p "Press Any Key to Continue"	
	break

elif [ $customks == "n" ] || [ $customks == "no" ];
then
        echo "Using Default Kicstart Configuration"
 	read -p "Press Any Key to Continue"
	break

else
	echo "Please Input yes/no"
fi

done
}

func_printks()
{

default="$(grep -e default /var/lib/tftpboot/pxelinux.cfg/default)"

echo "-------------CURRENT KS SCRIPT -------------"
if [[ $default == "default 1" ]];
then
        /usr/local/bin/ccat /var/www/html/ks/rhel7ks.cfg

elif [[ $default == "default 2" ]];
then
	/usr/local/bin/ccat /var/www/html/ks/rhel8ks.cfg

elif [[ $default == "default 3" ]];
then
        /usr/local/bin/ccat /var/www/html/ks/vmw6ks.cfg

elif [[ $default == "default 4" ]];
then
        /usr/local/bin/ccat /var/www/html/ks/vmw7ks.cfg

elif [[ $default == "default 5" ]];
then
        /usr/local/bin/ccat /var/www/html/ks/ubuntu2004.cfg

fi

echo "-------------CURRENT KS SCRIPT -------------"
read -p "Press Any Key to Continue"
}

# main procedure
while true
do
clear
echo "
$(tput setaf 6)----------------------------------------------
Welcome to Kickstart Configuration Wizard
Copyright 2021 NTT Indonesia Solutions. all rights reserved.

Before you perform OS provisioning, you must choose OS and define Kickstart Script Files.
$(tput setaf 3)
1. Redhat Enterprise Linux 7.8
2. Redhat Enterprise Linux 8.3
3. VMWare ESXi 6.7u3
4. VMWare ESXi 7.0u2a

c. Set Custom Script Kickstart
p. Print Current KS Script Configuration
q. Quit $(tput sgr 0)"

#Get Current
current="$(grep -e default /var/lib/tftpboot/pxelinux.cfg/default)"

if [[ $current == "default 1" ]];
then
	echo -e "\nCurrent Configuration: $(tput bold)Redhat Enterprise Linux 7.8$(tput sgr 0)\n"

elif [[ $current == "default 2" ]];
then
 	echo -e "\nCurrent Configuration: $(tput bold)Redhat Enterprise Linux 8.3$(tput sgr 0)\n"

elif [[ $current == "default 3" ]];
then
	echo -e "\nCurrent Configuration: $(tput bold)vSphere ESXi 6.7u3$(tput sgr 0)\n"

elif [[ $current == "default 4" ]];
then
	echo -e "\nCurrent Configuration: $(tput bold)vSphere ESXi 7.0u2a$(tput sgr 0)\n"

elif [[ $current == "default 5" ]];
then
	echo -e "\nCurrent Configuration: $(tput bold)Ubuntu Server 20.04$(tput sgr 0)\n"

else
	echo""

fi

read -p "$(tput setaf 3)$(tput setab 1)What OS you need to install? (input the number): $(tput sgr 0)" os_type

if [ $os_type == "q" ];
then
	break
elif [ $os_type == 1 ];
then
	sed -i "s/default 2/default 1/" "/var/lib/tftpboot/pxelinux.cfg/default"
	sed -i "s/default 3/default 1/" "/var/lib/tftpboot/pxelinux.cfg/default"
	sed -i "s/default 4/default 1/" "/var/lib/tftpboot/pxelinux.cfg/default"
	sed -i "s/default 5/default 1/" "/var/lib/tftpboot/pxelinux.cfg/default"
	echo "Kickstart Configuration Setting Redhat Enterprise Linux 7.8"
	read -p "Press Any Key to Continue"
elif [ $os_type == 2 ];
then
	sed -i "s/default 1/default 2/" "/var/lib/tftpboot/pxelinux.cfg/default"
	sed -i "s/default 3/default 2/" "/var/lib/tftpboot/pxelinux.cfg/default"
	sed -i "s/default 4/default 2/" "/var/lib/tftpboot/pxelinux.cfg/default"
	sed -i "s/default 5/default 2/" "/var/lib/tftpboot/pxelinux.cfg/default"
        echo "Kickstart Configuration Setting Redhat Enterprise Linux 8.3"
        read -p "Press Any Key to Continue"

elif [ $os_type == 3 ];
then
	sed -i "s/default 1/default 3/" "/var/lib/tftpboot/pxelinux.cfg/default"
	sed -i "s/default 2/default 3/" "/var/lib/tftpboot/pxelinux.cfg/default"
	sed -i "s/default 4/default 3/" "/var/lib/tftpboot/pxelinux.cfg/default"
	sed -i "s/default 5/default 3/" "/var/lib/tftpboot/pxelinux.cfg/default"
        echo "Kickstart Configuration Setting vSphere ESXi 6.7u3"
        read -p "Press Any Key to Continue"

elif [ $os_type == 4 ];
then
	sed -i "s/default 1/default 4/" "/var/lib/tftpboot/pxelinux.cfg/default"
	sed -i "s/default 2/default 4/" "/var/lib/tftpboot/pxelinux.cfg/default"
	sed -i "s/default 3/default 4/" "/var/lib/tftpboot/pxelinux.cfg/default"
	sed -i "s/default 5/default 4/" "/var/lib/tftpboot/pxelinux.cfg/default"
        echo "Kickstart Configuration Setting vSphere ESXi 7.0u2a"
        read -p "Press Any Key to Continue"

elif [ $os_type == 5 ];
then
	sed -i "s/default 1/default 5/" "/var/lib/tftpboot/pxelinux.cfg/default"
	sed -i "s/default 2/default 5/" "/var/lib/tftpboot/pxelinux.cfg/default"
	sed -i "s/default 3/default 5/" "/var/lib/tftpboot/pxelinux.cfg/default"
	sed -i "s/default 4/default 5/" "/var/lib/tftpboot/pxelinux.cfg/default"
        echo "Kickstart Configuration Setting Ubuntu Server 18.04"
        read -p "Press Any Key to Continue"

elif [ $os_type == "c" ];
then
	func_customks

elif [ $os_type == "p" ];
then
	func_printks
else
	echo -e "\nPlease choose from the option! \n"
 	read -p "Press Any Key to Continue"
fi
done
