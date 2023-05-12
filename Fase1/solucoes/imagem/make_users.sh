#!/bin/bash
#exec 1>/tmp/user_creationg_logs 2>&1 //no output 
group_list=("administracao" "enfermeiros" "medicos")
group_id=(1000 2000 3000)

#creating groups
for group_index in ${!group_list[@]}; do
  echo "${group_id[$group_index]} ${group_list[$group_index]}"
  groupadd -g "${group_id[$group_index]}" "${group_list[$group_index]}"
done

#adm users
for id_user in {1001..1015}
do
	temp_id=$(echo "$id_user"|cut -c3-)
	user_name=$(echo "adm${temp_id}")
	echo "$user_name"
	useradd -u $id_user $user_name
	chage -d 0 $user_name
	usermod -a -G administracao $user_name
	
done

#enfermeiros users
for id_user in {2001..2030}
do
	temp_id=$(echo "$id_user"|cut -c3-)
	user_name=$(echo "enfermeiro${temp_id}")
	echo "$user_name"
	useradd -u $id_user $user_name
	chage -d 0 $user_name
	usermod -a -G enfermeiros $user_name
done

#medic users
for id_user in {3001..3020}
do
	temp_id=$(echo "$id_user"|cut -c3-)
	user_name=$(echo "med${temp_id}")
	echo "$user_name"
	useradd -u $id_user $user_name
	chage -d 0 $user_name
	usermod -a -G medicos $user_name
done
