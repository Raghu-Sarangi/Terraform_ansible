[allservers]
testserver01 ansible_port=22 ansible_host=${testserver01}  ansible_user=ansibleadmin ansible_ssh_private_key_file=/home/ansibleadmin/.ssh/authorized_keys 
testserver02 ansible_port=22 ansible_host=${testserver02}  ansible_user=ansibleadmin ansible_ssh_private_key_file=/home/ansibleadmin/.ssh/authorized_keys
testserver03 ansible_port=22 ansible_host=${testserver03}  ansible_user=ansibleadmin ansible_ssh_private_key_file=/home/ansibleadmin/.ssh/authorized_keys
[pvtallservers]
testserver01 ansible_port=22 ansible_host=${pvttestserver01}  ansible_user=ansibleadmin ansible_ssh_private_key_file=/home/ansibleadmin/.ssh/authorized_keys 
testserver02 ansible_port=22 ansible_host=${pvttestserver02} ansible_user=ansibleadmin ansible_ssh_private_key_file=/home/ansibleadmin/.ssh/authorized_keys
testserver03 ansible_port=22 ansible_host=${pvttestserver03} ansible_user=ansibleadmin ansible_ssh_private_key_file=/home/ansibleadmin/.ssh/authorized_keys