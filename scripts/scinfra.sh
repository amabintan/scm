func_stopks ()
{
while true
do
echo "
----------------------------------------------
*** Stop Services ***

Please select from one of the following options :

1) XINETD
2) HTTPD
3) DHCP
4) All Services

b. Back
"
read -p "Option : " ans

clear
if [ $ans == "b" ];
then
	break

elif [ $ans == 1 ];
then
	systemctl stop xinetd
	systemctl status xinetd | grep 'Active'
	
elif [ $ans == 2 ];
then
	systemctl stop httpd
	systemctl status httpd | grep 'Active'

elif [ $ans == 3 ];
then
	systemctl stop dhcpd
	systemctl status dhcpd | grep 'Active'

elif [ $ans == 4 ];
then
	systemctl stop xinetd
	systemctl stop httpd
	systemctl stop dhcpd
	systemctl status xinetd | grep 'Active'
	systemctl status httpd | grep 'Active'
	systemctl status dhcpd | grep 'Active'

else
	echo -e "\nPlease choose from the option! \n"
fi
done
}

#===================================================================
func_startks ()
{
while true
do
echo "
----------------------------------------------
*** Start Services ***

Please select from one of the following options :

1) XINETD
2) HTTPD
3) DHCP
4) All Services

b. Back
"
read -p "Option : " ans

clear
if [ $ans == "b" ];
then
	break

elif [ $ans == 1 ];
then
	systemctl start xinetd
	systemctl status xinetd | grep 'Active'
elif [ $ans == 2 ];
then
	systemctl start httpd
	systemctl status httpd | grep 'Active'

elif [ $ans == 3 ];
then
	systemctl start dhcpd
	systemctl status dhcpd | grep 'Active'

elif [ $ans == 4 ];
then
echo "Start xinetd"
	systemctl start xinetd
	systemctl status xinetd | grep 'Active'
	sleep 1

echo "Start httpd"
	systemctl start httpd
	systemctl status httpd | grep 'Active'
	sleep 1

echo "Start dhcpd"
	systemctl start dhcpd
	systemctl status dhcpd | grep 'Active'

else
	echo -e "\nPlease choose from the option! \n"
fi
done
}

func_statusks ()
{
echo "
----------------------------------------------
XINETD :"
	systemctl status xinetd | grep "Active"
sleep 0.5

echo "
----------------------------------------------
HTTPD :"
	systemctl status httpd | grep "Active"
sleep 0.5
	
echo "
----------------------------------------------
DHCPD :"
	systemctl status dhcpd | grep "Active"
sleep 0.5
echo " "
read -p "Press Any Key to Continue"
}

#===================================================================
while true
do
echo "
----------------------------------------------
*** Kickstart Start/Stop Services ***

Please select from one of the following options :

1. Stop Kickstart Services
2. Start Kickstart Services
3. Status Kickstart Services

q. Quit
"
read -p "Option : " ans

clear
if [ $ans == q ];
then
	break

elif [ $ans == 1 ];
then
	echo "You choose option 1"
	func_stopks

elif [ $ans == 2 ];
then
	echo "You choose option 2"
	func_startks

elif [ $ans == 3 ];
then
        echo "You choose option 3"
        func_statusks

else
	echo -e "\nPlease choose from the option! \n"
fi

clear
done
