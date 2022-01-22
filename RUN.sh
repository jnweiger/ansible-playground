#! /bin/sh

bash docker-test-dummy.sh
ipaddr=$(docker inspect ansible-test-dummy -f "{{ .NetworkSettings.IPAddress }}")
ansible-playbook bootstrap.yml -i "$ipaddr," -u root

