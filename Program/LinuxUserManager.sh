#!/usr/bin/bash
# usermanaget 0.01 by OPS 2020
# Author @nu11secur1ty
# Developers V.Varbanovski and G.Dzhankushev
# Menu
echo ""
echo -e "\e[34mWELCOME TO THE USER MANAGER PROGRAM by OPS from V.Varbanovski\nSystem Administrator - Infrastructure, and Linux architect\e[0m"
 

PS3='Please enter your choice: '
options=("Creating of users and groups" "Moving users to groups" "Delete users and groups" "Create user with directory" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Creating of users and groups")
           
	 	echo -e "\e[31mCreate your new user without home directory, give the name...\e[0m"
        	read new_user
                useradd -M $new_user
       	 		echo""
		echo -e "\e[31mCreate your new group for your new user, give the name...\e[0m"
        	read new_group
                groupadd $new_group
		echo -e "\e[31mDone, now you can see your new user, where is he...\e[0m"
                cat /etc/group | grep $new_user
       		
            ;;
        "Moving users to groups")
		echo -e "\e[31mMove your new user to your new group by giving as the names...\e[0m"
        	echo "the group"
		read move_group
		echo "the user"
		read move_user
                usermod -a -G $move_group $move_user
		echo -e "\e[31mDone, now you can see where is your user...\e[0m"
                cat /etc/group | grep $move_user
            
            ;;
        "Delete users and groups")
		echo -e "\e[31mDeleating users and groups by giving as the names...\e[0m"
                echo "the group"
                read move_group_exist
                echo "the user"
                read move_user_exist
                groupdel $move_group_exist
		userdel $move_user_exist
			rm -rf /home/$move_user_exist
			rm -rf /var/mail/$move_user_exist
		echo -e "\e[31mDone, now you can see where is your user and your group =)...\e[0m"
                cat /etc/group | grep $move_user_exist
		cat /etc/group | grep $move_group_exist
            	
            ;;
    	"Create user with directory")
		echo -e "\e[31mCreate your new user with home directory, give the name...\e[0m"
                read new_user_homedir
                useradd -d $new_user_homedir
                        echo""
                echo -e "\e[31mDone, now you can see your new user, where is he...\e[0m"
                cat /etc/group | grep $new_user_homedir

            ;;
        "Quit")
            exit 0
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
