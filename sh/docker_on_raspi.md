# Install Docker on a Raspi & Portainer

'curl -fsSL https://get.Docker.com -o get-Docker.sh'

'sudo sh get-Docker.sh'

'sudo usermod -aG docker $USER'

'newgrp docker'

# Portainer

'docker volume create portainer_data'

'docker run -d -p 8000:8000 -p 9000:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest'