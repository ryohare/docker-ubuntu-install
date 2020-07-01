sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo apt install docker-compose unzip -y
sudo usermod -aG docker ${USER}
git clone https://github.com/samrocketman/docker-compose-ha-consul-vault-ui.git
cd doc*
./scripts/consul-agent.sh --bootstrap
docker-compose up --scale vault=1 -d
./scripts/initialize-vault.sh
