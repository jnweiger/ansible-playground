#! /bin/sh
# Study https://docs.ansible.com/ansible/latest/network/getting_started/first_inventory.html#basic-inventory

bash docker-test-dummy.sh
ipaddr=$(docker inspect ansible-test-dummy -f "{{ .NetworkSettings.IPAddress }}")
ansible-playbook bootstrap.yml -i "$ipaddr," -u root
ansible-playbook  inkscape.yml -i "$ipaddr," -u root

# should be version 1.1
ssh root@$ipaddr inkscape --version

echo "Press Enter to kill docker container ansible-test-dummy"
read a
docker kill ansible-test-dummy
