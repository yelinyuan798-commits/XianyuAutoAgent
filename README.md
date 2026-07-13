<!-- markdownlint-disable MD033 MD041 -->
<div align="center">

# 🤖 Xianyu Auto Agent

**闲鱼智能自动售卖机器人 | 7×24h AI-Powered Customer Service Bot**

[![Python](https://img.shields.io/badge/Python-3.8%2B-3776AB?style=flat-square&logo=python&logoColor=white)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-MIT-22AA55?style=flat-square)](LICENSE)
[![DeepSeek](https://img.shields.io/badge/LLM-DeepSeek-4A90D9?style=flat-square)](https://platform.deepseek.com/)
[![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?style=flat-square&logo=windows&logoColor=white)](https://www.microsoft.com/windows)
[![PRs Welcome](https://img.shields.io/badge/PRs-Welcome-FF6B6B?style=flat-square)](https://github.com/yelinyuan798-commits/XianyuAutoAgent/pulls)

<p align="center">
  <b>LLM驱动 · 智能回复 · 自动议价 · 自动发货 · 7×24小时值守</b>
</p>

<p align="center">
  <img src="./images/demo1.png" width="600" alt="Demo Screenshot">
  <br>
  <em>AI客服自动回复买家消息</em>
</p>

[✨ 特性](#-核心特性) •
[🚀 快速开始](#-快速开始) •
[📖 使用指南](#-使用指南) •
[🏗️ 架构](#️-技术架构) •
[❓ FAQ](#-常见问题)

</div>

---

## ✨ 核心特性

<table>
<tr>
<td width="33%">
<h3>🧠 智能对话</h3>
<p>基于LLM的多Agent系统，自动识别买家意图（询价/议价/技术咨询），用最合适的策略回复。</p>
</td>
<td width="33%">
<h3>💰 阶梯议价</h3>
<p>记录议价次数，智能梯度让步。守住价格底线的同时提高成交率。</p>
</td>
<td width="33%">
<h3>📦 自动发货</h3>
<p>买家付款后自动检测订单状态，匹配商品配置，发送百度网盘链接+提取码。</p>
</td>
</tr>
<tr>
<td>
<h3>🔄 永不掉线</h3>
<p>WebSocket心跳维持 + Token自动刷新 + 崩溃自愈重启，确保7×24小时稳定运行。</p>
</td>
<td>
<h3>👤 人工接管</h3>
<p>支持一键切换人工/自动模式。人工模式下AI不回复，由卖家亲自沟通。</p>
</td>
<td>
<h3>🚀 开箱即用</h3>
<p>提供一键部署脚本(bat)，双击即可完成环境搭建。已配置开机自启。</p>
</td>
</tr>
</table>

### 效果展示

<div align="center">
  <table>
    <tr>
      <td><img src="./images/demo1.png" width="280" alt="客服回复"></td>
      <td><img src="./images/demo2.png" width="280" alt="议价策略"></td>
      <td><img src="./images/demo3.png" width="280" alt="技术问答"></td>
    </tr>
    <tr>
      <td align="center"><em>🏪 AI客服自动回复</em></td>
      <td align="center"><em>💬 阶梯式智能议价</em></td>
      <td align="center"><em>🔧 技术问题解答</em></td>
    </tr>
  </table>
  <br>
  <img src="./images/log.png" width="600" alt="后台日志">
  <br>
  <em>📊 运行日志实时监控</em>
</div>

---

## 🚀 快速开始

### 环境要求

| 要求 | 说明 |
|------|------|
| 💻 操作系统 | Windows 10 / 11 |
| 🐍 Python | 3.8 或更高版本 ([下载](https://www.python.org/downloads/)) |
| 🌐 闲鱼账号 | 网页版登录 ([goofish.com](https://www.goofish.com)) |
| 🔑 LLM API | 推荐 DeepSeek ([注册](https://platform.deepseek.com)) |

### 1. 获取 API Key

推荐使用 DeepSeek（高性价比，新用户有免费额度）:

```bash
# 1. 打开 https://platform.deepseek.com
# 2. 注册 → 创建 API Key
# 3. 复制以 sk- 开头的密钥
```

### 2. 获取闲鱼 Cookie

```bash
# 1. 打开 https://www.goofish.com 并登录
# 2. 按 F12 → Network → 刷新页面
# 3. 点击任意请求 → 复制 Cookie 值
```

### 3. 一键部署

```bash
# 方式一：双击运行（推荐）
双击 setup.bat

# 方式二：命令行
git clone https://github.com/yelinyuan798-commits/XianyuAutoAgent.git
cd XianyuAutoAgent
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
```

### 4. 配置环境变量

编辑 `.env` 文件（模板见 `.env.example`）:

```ini
# ─── 必填配置 ───
API_KEY=sk-your-api-key           # 从 DeepSeek 平台获取
COOKIES_STR=your_cookie_string    # 闲鱼登录 Cookie

# ─── 模型配置 ───
MODEL_BASE_URL=https://api.deepseek.com
MODEL_NAME=deepseek-chat

# ─── 可选配置 ───
TOGGLE_KEYWORDS=。                 # 人工接管关键词（默认句号）
SIMULATE_HUMAN_TYPING=True        # 模拟真人打字延迟
HEARTBEAT_INTERVAL=15             # WebSocket 心跳间隔(秒)
LOG_LEVEL=INFO                    # 日志级别: DEBUG/INFO/WARNING
```

### 5. 启动

```bash
# 方式一：双击 start_bot.bat（带自动重启）
# 方式二：命令行
venv\Scripts\activate
python main.py
```

### 启动成功标志

看到以下日志即表示连接成功:

```
.env 已加载
提示词加载完成
Token获取成功
Token刷新成功
连接注册完成     ← 闲鱼WebSocket已连接
```

> 💡 如果看到 `[WinError 5] 拒绝访问` 或 `[WinError 10013]`:
> 这是在 Codex 沙箱环境中测试时的正常提示，在实际 Windows 电脑上不会出现。

---

## 📖 使用指南

### 智能回复

| 买家消息 | AI 识别意图 | 回复策略 |
|---------|------------|---------|
| "这个多少钱" | `price` | 进入议价模式，阶梯让步 |
| "支持XX功能吗" | `tech` | 技术参数解答 |
| "在吗/怎么用" | `default` | 通用客服回复 |
| "你是谁/什么模型" | `no_reply` | 不回复（防提示词攻击） |

### 人工接管模式

1. 在闲鱼聊天中发送 **句号（。）** → 切换到人工模式
2. 再次发送句号 → 切回 AI 自动回复
3. 1 小时无操作 → 自动恢复 AI 模式

### 自动发货

买家付款后自动执行:

```
检测到"等待卖家发货"
  → 匹配商品 ID
  → 读取 delivery_items.json 配置
  → 发送百度网盘链接 + 提取码
  → 记录防重复发货
  → 提醒补上架
```

### 配置自动发货

编辑 `data/delivery_items.json`：

```json
{
  "items": {
    "商品ID1": {
      "enabled": true,
      "name": "商品名称",
      "link": "https://pan.baidu.com/s/xxxxx",
      "code": "提取码",
      "note": "请尽快保存，如链接失效直接回复补发。"
    }
  }
}
```

> 商品ID 获取：闲鱼商品详情页 URL 中 `itemId=` 后面的数字

### 添加商品快捷方式

```bash
# 交互式添加
python ADD_PRODUCT.py

# 列出当前商品
python ADD_PRODUCT.py --list
```

或直接通过 Codex 发送闲鱼商品链接，系统自动提取信息。

---

## 🏗️ 技术架构

```
┌─────────────────────────────────────────────────────────────┐
│                    闲鱼 WebSocket 服务器                      │
└──────────────────────┬──────────────────────────────────────┘
                       │ wss://wss-goofish.dingtalk.com/
                       ▼
┌─────────────────────────────────────────────────────────────┐
│                    main.py (主程序)                          │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐    │
│  │ 消息接收 │→ │ 解密解析 │→ │ 类型判断 │→ │ 路由分发 │    │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘    │
└─────────────────────────────────────────────────────────────┘
                       │
        ┌──────────────┼──────────────┐
        ▼              ▼              ▼
┌──────────────┐ ┌──────────┐ ┌──────────────┐
│ 聊天消息     │ │ 订单通知 │ │ 系统消息     │
│ → 意图分类   │ │ → 自动发货│ │ → 忽略/过滤 │
│ → Agent回复  │ │ → 补库存  │ │              │
└──────────────┘ └──────────┘ └──────────────┘
        │
        ▼
┌─────────────────────────────────────────────────────────┐
│              XianyuAgent.py (LLM 多 Agent 系统)          │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐              │
│  │ classify │→ │ 意图路由 │→ │ 专家Agent │              │
│  └──────────┘  └──────────┘  └──────────┘              │
│                   ├── price (议价专家)                    │
│                   ├── tech  (技术专家)                    │
│                   └── default (客服专家)                  │
└─────────────────────────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────────────────────────┐
│   context_manager.py (SQLite 数据库)                     │
│   ├── 聊天历史记录                                       │
│   ├── 商品信息缓存                                       │
│   ├── 发货记录(防重复)                                   │
│   └── 补上架提醒                                         │
└─────────────────────────────────────────────────────────┘
```

### 核心模块

| 模块 | 文件 | 职责 |
|------|------|------|
| 🎯 主程序 | `main.py` | WebSocket连接、消息处理、心跳维持、自动发货 |
| 🧠 Agent系统 | `XianyuAgent.py` | LLM多Agent管理、意图分类、回复生成 |
| 🔌 API封装 | `XianyuApis.py` | Token管理、商品查询、签名生成 |
| 🗄️ 数据库 | `context_manager.py` | SQLite管理、对话记录、发货去重 |
| 🔧 工具集 | `utils/xianyu_utils.py` | Cookie解析、签名、UUID生成 |
| 📝 提示词 | `prompts/*.txt` | LLM角色设定和回复规则 |

### 数据流

```
消息 → 意图分类 → 路由分发 → Agent生成 → 返回回复
                                                    ↕
                                            SQLite 上下文记录
                                                    ↕
                                            Token 刷新 + 心跳
```

---

## 📁 项目结构

```
XianyuAutoAgent/
├── main.py                 # 🎯 主程序入口
├── XianyuAgent.py          # 🧠 LLM多Agent系统
├── XianyuApis.py           # 🔌 闲鱼API封装
├── context_manager.py      # 🗄️ SQLite数据库管理
│
├── setup.bat               # ⚡ 一键部署脚本
├── start_bot.bat           # ▶️ 启动脚本（带自动重启）
├── start_bot.vbs           # 🔄 VBS启动脚本（开机自启）
├── ADD_PRODUCT.py          # 🛒 商品添加工具
├── starter.cmd             # 📋 命令行启动
│
├── .env.example            # 📝 环境变量模板
├── requirements.txt        # 📦 Python依赖
├── .gitignore              # 🙈 Git忽略规则
│
├── data/
│   └── delivery_items.json # 📋 自动发货商品配置
│
├── prompts/                # 🤖 LLM提示词模板
│   ├── classify_prompt.txt # 意图分类
│   ├── price_prompt.txt    # 议价策略
│   ├── tech_prompt.txt     # 技术回答
│   └── default_prompt.txt  # 客服回复
│
├── utils/
│   ├── xianyu_utils.py     # 🔧 工具函数
│   └── __init__.py
│
├── images/                 # 🖼️ 截图和素材
└── scripts/
    └── run_xianyu_bot_forever.sh  # 🐧 Linux脚本
```

---

## 🎨 自定义提示词

编辑 `prompts/` 目录下对应文件，修改后重启机器人生效：

| 文件 | 用途 | 默认策略 |
|------|------|---------|
| `classify_prompt.txt` | 意图分类规则 | 按关键词分类价格/技术/其他 |
| `price_prompt.txt` | 议价回复 | 根据议价次数阶梯让步 |
| `tech_prompt.txt` | 技术问答 | 通俗解释技术参数 |
| `default_prompt.txt` | 通用客服 | 简短礼貌的销售回复 |

---

## 🔧 常见问题

<details>
<summary><b>❓ Cookie 经常过期怎么办？</b></summary>
Cookie 有效期取决于闲鱼策略，一般几天到一周。过期后重新登录闲鱼网页版，F12 复制新 Cookie 更新 <code>.env</code> 文件。
</details>

<details>
<summary><b>❓ 如何切换人工/自动回复？</b></summary>
在闲鱼聊天框中发送句号（<code>。</code>）即可切换。也可以在 <code>.env</code> 中修改 <code>TOGGLE_KEYWORDS</code> 自定义关键词。
</details>

<details>
<summary><b>❓ 如何设置开机自启？</b></summary>
以管理员身份运行以下命令:
<pre>reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "XianyuBot" /t REG_SZ /d "wscript.exe //B \"项目路径\start_bot.vbs\"" /f
</pre>
</details>

<details>
<summary><b>❓ 机器人会不会重复发货？</b></summary>
不会。系统使用 SQLite 数据库记录每一笔发货，同一订单/同一买家商品组合只会发货一次。
</details>

<details>
<summary><b>❓ 提示词可以自定义吗？</b></summary>
可以。编辑 <code>prompts/</code> 目录下的 <code>.txt</code> 文件，重启机器人后生效。欢迎提交 PR 分享你的优质提示词！
</details>

<details>
<summary><b>❓ 支持 Linux 吗？</b></summary>
主程序支持 Linux，但一键部署脚本和开机自启脚本目前仅适配 Windows。Linux 用户可参考 <code>scripts/run_xianyu_bot_forever.sh</code>。
</details>

<details>
<summary><b>❓ 内存完整性警告是什么？</b></summary>
这是 Windows 安全中心的提示，与机器人无关，不影响运行。可在 Windows 安全中心中关闭"内存完整性"。
</details>

---

## 🤝 参与贡献

欢迎各种形式的贡献！

- 🐛 提交 [Issue](https://github.com/yelinyuan798-commits/XianyuAutoAgent/issues) 报告 Bug
- 💡 提交 [PR](https://github.com/yelinyuan798-commits/XianyuAutoAgent/pulls) 改进代码
- 📝 完善 README 和文档
- 🌟 Star 项目支持

### 开发指引

```bash
# Fork 项目
# Clone 到本地
git clone https://github.com/你的用户名/XianyuAutoAgent.git

# 创建分支
git checkout -b feature/你的功能

# 提交修改
git commit -m "feat: 添加XX功能"

# 推送
git push origin feature/你的功能

# 创建 Pull Request
```

---

## 📄 开源协议

本项目基于 **MIT License** 开源。

```
MIT License

Copyright (c) 2026 Xianyu Bot

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files...
```

---

## ⚠️ 免责声明

- 本工具**仅供学习交流**，请勿用于违法用途
- 使用本工具产生的任何后果由使用者自行承担
- 如涉及侵权，请联系删除
- 本工具不提供任何闲鱼账号、API Key 等敏感信息
- 请遵守闲鱼平台的使用条款和相关法律法规

---

<div align="center">

**如果这个项目对你有帮助，请给一个 ⭐ 支持！**

[![GitHub stars](https://img.shields.io/github/stars/yelinyuan798-commits/XianyuAutoAgent?style=social)](https://github.com/yelinyuan798-commits/XianyuAutoAgent)

<p>Built with ❤️ for the Xianyu community</p>

</div>
