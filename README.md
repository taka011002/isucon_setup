# GithubにPushするまで
## コマンドでSSH鍵を配置する
```
./setup-github-key.sh
```

## gitのユーザー情報を設定
```
git config --global user.email "hoge@example.com"
git config --global user.name "Foo Bar"
```

## Githubへの接続
```
git init
git commit --allow-empty -m "first commit"
git branch -M main
git remote add origin git@github.com:taka011002/isucon_setup.git
git push -u origin main
```

# 諸々のインストール
```
./setup-tools.sh
```
で色々入るはず。下記はその説明

## alp のインストール
インストール
```
curl -OL https://github.com/tkuchiki/alp/releases/download/v1.0.7/alp_linux_amd64.zip
unzip alp_linux_amd64.zip
sudo install alp /usr/local/bin/alp
```
実行
```
cat /var/log/nginx/access.log | alp ltsv -r | head -n 100
```

## pt-query-digestのインストール
インストール
```
wget https://www.percona.com/downloads/percona-toolkit/3.0.3/binary/debian/jessie/x86_64/percona-toolkit_3.0.3-1.jessie_amd64.deb
sudo apt-get install -y gdebi
sudo gdebi -n percona-toolkit_3.0.3-1.jessie_amd64.deb
```
実行
```
pt-query-digest /var/lib/mysql/mysql-slow.log
```