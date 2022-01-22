#! /bin/bash
#
# run a docker container, so that ansible can exercise deployments easily

docker build -t ansible-test-dummy -f Dockerfile.ansible-test-dummy .
docker run --rm --name ansible-test-dummy -d ansible-test-dummy
docker inspect ansible-test-dummy -f "{{ .NetworkSettings.IPAddress }}"

