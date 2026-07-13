#!/bin/zsh
PROJECT_DIR="/Users/gift/Documents/personal development/XianyuAutoAgent"
LOG_FILE="$PROJECT_DIR/logs/xianyu-bot.log"
COOKIE_NOTICE_FILE="$PROJECT_DIR/logs/cookie-expired.log"

cd "$PROJECT_DIR" || exit 1
mkdir -p logs

echo "[$(date '+%Y-%m-%d %H:%M:%S')] 闲鱼机器人守护脚本启动" >> "$LOG_FILE"

while true; do
  "$PROJECT_DIR/.venv/bin/python" "$PROJECT_DIR/main.py" >> "$LOG_FILE" 2>&1
  status=$?

  if [ "$status" = "2" ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Cookie 过期，停止自动重启。请更新 .env 后重新启动。" >> "$COOKIE_NOTICE_FILE"
    /usr/bin/osascript -e 'display notification "Cookie 已过期，请更新 .env 里的 COOKIES_STR 后重新启动机器人" with title "闲鱼机器人已停止"'
    exit 2
  fi

  echo "[$(date '+%Y-%m-%d %H:%M:%S')] 机器人异常退出，退出码 $status，10 秒后重启" >> "$LOG_FILE"
  sleep 10
done
