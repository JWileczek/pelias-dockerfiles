#!/usr/bin/env bash


set -e


##
# variables
docker_version=18.06.1
docker_compose_version=1.22.0
##


##
# docker > 17.06.2-ce
if ! type docker > /dev/null 2>&1; then
  yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
  yum makecache fast
  yum install -y docker-ce-${docker_version}.ce-1.el7.centos
  systemctl start docker
  systemctl status docker
  test "$(docker --version | awk '{print $3}')" = "${docker_version}-ce,"
fi
##


##
# docker-compose > v1.14.0
if ! type docker-compose > /dev/null 2>&1; then
  curl -sSL https://github.com/docker/compose/releases/download/${docker_compose_version}/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  test "$(docker-compose --version | awk '{print $3}')" = "${docker_compose_version},"
fi
##


##
# vagrant user
usermod -a -G docker vagrant
##