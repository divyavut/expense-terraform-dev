#!/bin/bash 
dnf install ansible -y 
cd /tmp
git clone https://github.com/divyavut/Ansible-project.git
cd Ansible-project/Expense-project
ansible-playbook -i inventory.ini mysql.yaml
ansible-playbook -i inventory.ini backend.yaml
ansible-playbook -i inventory.ini frontend.yaml
