DOCKER_DISTRO="Debian"
DOCKER_DIR=/mnt/wsl/shared-docker
DOCKER_SOCK="$DOCKER_DIR/docker.sock"
export DOCKER_HOST="unix://$DOCKER_SOCK"

if [ ! -S "$DOCKER_SOCK" ]; then
	mkdir -pm o=,ug=rwx "$DOCKER_DIR"
	chgrp docker "$DOCKER_DIR"
	nohup sudo -b dockerd < /dev/null > $DOCKER_DIR/dockerd.log 2>&1
fi

