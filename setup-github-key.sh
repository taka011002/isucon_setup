# Github用のSSH鍵を配置する
HOSTS=("isucon11-1" "isucon11-2" "isucon11-3")
SSH_KEY_DIR=~/.ssh/keys/isucon-server

upload_ssh_key() {
    HOST=$1

    echo "upload ssh key to ${HOST}..."
    ssh $HOST 'mkdir -p ~/.ssh'
    scp ${SSH_KEY_DIR}/id_rsa ${SSH_KEY_DIR}/id_rsa.pub  ${HOST}:~/.ssh/
    ssh $HOST 'chmod 600 ~/.ssh/id_rsa*'
    echo "success: upload ssh key to ${HOST}"
}

for v in "${HOSTS[@]}"; do
upload_ssh_key $v &
done
wait