HOSTS=("isucon11-1" "isucon11-2" "isucon11-3")

setup() {
HOST=$1

echo "setup to ${HOST}..."
ssh $HOST << EOS
sudo apt -y update
sudo apt -y upgrade
sudo apt-get install -y curl git unzip
sudo apt install -y htop
curl -OL https://github.com/tkuchiki/alp/releases/download/v1.0.7/alp_linux_amd64.zip
unzip alp_linux_amd64.zip
sudo install alp /usr/local/bin/alp
wget https://www.percona.com/downloads/percona-toolkit/3.0.3/binary/debian/jessie/x86_64/percona-toolkit_3.0.3-1.jessie_amd64.deb
sudo apt-get install -y gdebi
sudo gdebi -n percona-toolkit_3.0.3-1.jessie_amd64.deb
EOS

echo "succeed setup to ${HOST}"
}

for v in "${HOSTS[@]}"; do
setup $v &
done
wait