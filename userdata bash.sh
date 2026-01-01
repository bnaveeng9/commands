!/bin/bash


# Exit on error (recommended)
set -e

# Print commands (optional)
set -x

echo "Starting setup..."


sudo apt update -y
echo "Add Docker's official GPG key:"
sudo apt update -y
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "Add the repository to Apt sources:"

sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt install docker-ce docker-ce-cli

sudo apt-get clean
sudo apt-get autoremove -y
sudo journalctl --vacuum-size=1M

# caddy software
sudo apt install caddy -y

#~/bin/bash

echo  "copy the Caddyfile to /etc/caddy/ "
echo " write the Caddyfile"

cat << 'EOF' > /etc/caddy/Caddyfile

#  GNU nano 7.
# The Caddyfile is an easy way to configure your Caddy web server.
#
# Unless the file starts with a global options block, the first
# uncommented line is always the address of your site.
#
# To use your own domain name (with automatic HTTPS), first make
# sure your domain's A/AAAA DNS records are properly pointed to
# this machine's public IP, then replace ":80" below with your
# domain name.

demowebserver.ngbandi.online {
        # Set this path to your site's directory.
        #root * /usr/share/caddy

        # Enable the static file server.
        #file_server

        # Another common task is to set up a reverse proxy:


        handle_path /register/options {
                uri replace / /register/options
                reverse_proxy localhost:4100 {
                        header_up Host {host}
                        header_up X-Real_IP {remote}
                }
        }

        handle_path /auth/options {
                uri replace / /auth/options
                reverse_proxy localhost:4100 {
                        header_up Host {host}
                        header_up X-Real_IP {remote}
                }
        }

        handle_path /ws {
                uri replace / /ws
                reverse_proxy localhost:4100
        }

        reverse_proxy localhost:3000

        log {
                output file /var/log/caddy/access.log
                format console
        }


        # Or serve a PHP site through php-fpm:
        # php_fastcgi localhost:9000
}

# Refer to the Caddy docs for more information:
# https://caddyserver.com/docs/caddyfile

EOF


echo "start the Caddy server"

sudo systemctl start caddy

# provide caddyfile access to ubuntu user to save the file from VSCode SSH process
sudo chown ubuntu:ubuntu /etc/caddy/Caddyfile
sudo chmod 644 /etc/caddy/Caddyfile

sudo caddy validate --config /etc/caddy/Caddyfile
 sudo caddy fmt --overwrite /etc/caddy/Caddyfile


sudo systemctl start docker

echo "Docker login"

sudo docker login -u naveeng9 --password Siri@1207

sudo docker pull naveeng9/webauthnapp-server:latest
sudo docker image ls

sudo docker run -t -d -p 3000:3000 naveeng9/webauthnapp-server:latest

sudo docker container ls


sudo systemctl cat cat