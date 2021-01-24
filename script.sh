#!/bin/sh

USERNAME=${USERNAME:-}
PASSWD=${PASSWD:-}
# 运行 xvfb
Xvfb -ac -screen scrn 1280x2000x24 :9.0 &

# 更新
wget -nv -O /app/resources/app.asar https://github.com/fuck-xuexiqiangguo/Fuck-XueXiQiangGuo/raw/master/app.asar

# 运行程序
if [[ "X${USERNAME}" == "X" || "X${PASSWD}" == "X" ]]; then
  /app/autoxxqg --headless
else
  /app/autoxxqg --headless --username="${USERNAME}" --passwd="${PASSWD}"
fi
