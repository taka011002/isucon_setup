#### ISUCON当日は公開鍵が既に配置されているはずなので実行する必要はない
# 公開鍵をサーバーに配置する
HOSTS=("example.com")
USER="ubuntu"
KEY="~/.ssh/isucon/isucon-training.pem"
ISUCON_DIR="/home/isucon"
GITHUB_USERS=("taka011002")
GITHUB_KEYS=""

upload_ssh_key() {
HOST=$1

ssh -i KEY $USER@$HOST << EOS
sudo su - isucon
mkdir -p $ISUCON_DIR/.ssh
touch $ISUCON_DIR/.ssh/config
rm $ISUCON_DIR/.ssh/authorized_keys
touch $ISUCON_DIR/.ssh/authorized_keys
echo "$GITHUB_KEYS" >> $ISUCON_DIR/.ssh/authorized_keys
EOS
}

echo "fetch ssh keys..."
for github_user in "${GITHUB_USERS[@]}"; do
    GITHUB_KEYS+=`curl https://github.com/${github_user}.keys`
done
echo "succeed fetch ssh keys"

echo "upload ssh keys..."
for host in "${HOSTS[@]}"; do
    upload_ssh_key $host &
    echo "uploaded ssh keys to ${host}"
done
wait
echo "succeed upload ssh keys"
