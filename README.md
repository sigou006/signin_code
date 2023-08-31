# Warning：官方修改了Token，请所有于20230729前Fork此项目的用户拉取最新代码

# GLaDOS-Signin

修改优化自[QikaiXu/GLaDOS-checkin](https://github.com/QikaiXu/GLaDOS-checkin)，感谢开源，本仓库有如下Features：

- [x] 通过 GitHub Action 实现自动签到**多个**用户, 每天签到可以延时一天
- [x] 发送邮件通知(可选)，
- [x] 微信[Server酱](https://sct.ftqq.com/)通知(可选)
- [x] [Telegram Bot](https://github.com/appleboy/telegram-action)通知(可选)
- [x] [pushplus(推送加)](http://www.pushplus.plus/)通知(可选)

### Todo List
- [ ] [添加企业微信通知功能](https://work.weixin.qq.com)

在进行自动签到一定次数后，GLaDOS会进行限制，使得只有 1/3 的几率获得 1 天的奖励

[GLaDOS 地址发布链接](https://github.com/glados-network/GLaDOS)

[GLaDOS 官网](https://glados.rocks/)

如果还没有注册的话，欢迎去[这里](https://d7yov-ty0yd-06hy9-roc9w.glados.space)注册，然后填写邀请码：**D7YOV-TY0YD-06HY9-ROC9W**。双方均获得天数。

## 步骤

### 1 fork 这个仓库

![](https://github.com/Adonis142857/GLaDOS-Signin/blob/main/ReadmePhoto/1.jpg)

点击右上角的 fork，并创建相应仓库

### 2 获取 cookie

![](https://github.com/Adonis142857/GLaDOS-Signin/blob/main/ReadmePhoto/2.jpg)

打开[GLaDOS 签到界面](https://glados.rocks/console/checkin)

进行如下操作：

1.按下F12打开开发者工具并选择Network栏目

2.点击签到按钮

3.选择右侧checkin项目

4.获取cookie

举例：上图中我获取的即为
`koa:sess=eyJ1c2VySWQiOjI2NTQ0MiwiX2V4cGlyZSI6MTcxNTU4MzAwNDgxOCwiX21heEFnZSI6MjU5MjAwMDAwMDB9; koa:sess.sig=UA9IHbIb`

### 3 设置 cookie

在 fork 后在**自己的**仓库中依次点击 `Settings` - `Secrets and variables` - `Actions` - `New repository secret`，如下图所示：

![](https://github.com/Adonis142857/GLaDOS-Signin/blob/main/ReadmePhoto/3.jpg)

然后添加一个名为 `COOKIE` 的变量，内容为获取到的 cookie

可以直接设置多个用户COOKIE，每行一个，按如下规则设置：

```
COOKIE1
COOKIE2
COOKIE3
```

`COOKIE` 示例：

```text
koa:sess=eyJ1c2VySWQiOjI2NTQ0MiwiX2V4cGlyZSI6MTcxNTU4MzAwNDgxOCwiX21heEFnZSI6MjU5MjAwMDAwMDB9; koa:sess.sig=UA9IHbIb
koa:sess=eyJ1c2VySWQiOjI2e32e3r4r4e323ZSI6MTcxNTU4MzAwNDgxOCwiX21heEFnZSI6MjU5MjAwMDAwMDB9; koa:sess.sig=UA9dwedHb
```
### 4 设置通知：
**1. 设置邮件通知 [可选]**

如果需要邮件通知再设置如下变量，不需要可直接跳到第5步

1. 添加一个名为 `USE_SMTP` 的变量，内容为 `true`
2. 添加一个名为 `SMTP_SERVER` 的变量，内容为 `SMTP服务器的地址，例如：smtp.gmail.com`
3. 添加一个名为 `SMTP_PORT` 的变量，内容为 `SMTP服务器的端口号，例如：465`
4. 添加一个名为 `SMTP_USERNAME` 的变量，内容为 `发送签到通知邮件的邮箱名称名，例如：Poster@gmail.com`
5. 添加一个名为 `SMTP_PASSWORD` 的变量，内容为 `发送邮件的账户的SMTP服务专属密码，例如：UNWOKGSPSWSTUFRM`
6. 添加一个名为 `SMTP_RECEIVER` 的变量，内容为 `接收签到通知邮件的邮箱名称，例如：Receiver@gmail.com`

**2. 设置Server酱通知 [可选]**

如果需要微信[Server酱](https://sct.ftqq.com/)通知再设置如下变量，不需要可直接跳到第5步

1. 添加一个名为 `USE_SERVER` 的变量，内容为 `true`
2. 添加一个名为 `SENDKEY` 的变量，内容为 [Server酱](https://sct.ftqq.com/sendkey) 提供的 `SendKey`

**3. 设置Telegram通知 [可选]**

如果需要Telegram通知再设置如下变量，不需要可直接跳到第5步

1. 添加一个名为 `USE__TELEGRAM` 的变量，内容为 `true`
2. 添加一个名为 `ChatID` 的变量，内容为 [get_id_bot](https://t.me/get_id_bot) 提供的 `ChatID`
3. 向[通知机器人](https://t.me/GLaDOS_Signin_bot)发一条信息，来解锁使用权限

**4. 设置pushplus(推送加)通知 [可选]**

1. 添加一个名为 `PUSHPLUS_SERVER` 的变量，内容为 `true`
2. 添加一个名为 `PUSHPLUS_TOKEN` 的变量，内容为 [pushplus(推送加)](http://www.pushplus.plus/push1.html) 提供的 `token`


### 5 启用工作流程

1. 修改签到计划

    在`.github/workflows/run.yml`中修改action的执行时间(见代码注释)，并提交

2. 在存储库名称下，单击 “操作”
![](https://docs.github.com/assets/cb-21779/mw-1440/images/help/repository/actions-tab.webp)

3. 在左侧边栏中，单击启用的工作流程
![](https://docs.github.com/assets/cb-52849/mw-1440/images/help/repository/actions-select-disabled-workflow-2022.webp)

4. 单击“启用工作流”

5. 首次启动需核查，左侧栏中 `GLaDOS-Signin` 和 `Monthly Update Action` 均运行正常


### 说明 

本项目需用户在首次使用时，按照[启动工作流程](#5-启用工作流程), 手动开启

默认配置下，之后就会每隔 8 小时进行一次签到（服务器质量问题，每日只进行1次容易导致签到失败）

注意，在官方文档中有这么一段：

> To prevent unnecessary workflow runs, scheduled workflows may be disabled automatically. When a public repository is forked, scheduled workflows are disabled by default. In a public repository, scheduled workflows are automatically disabled when no repository activity has occurred in 60 days.

也就是说，**定时执行的任务需要每隔 60 天激活一次**

为了解决上述问题，`Monthly Update Action` 在手动开启后，每隔一个月，向仓库的 `monthly.log` 文件中（首次启动后出现）追加日志，防止actions停用

### 👩‍💻 Contributors

[![Adonis142857](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/77864027?v=4&w=50&h=50&mask=circle)](https://github.com/Adonis142857)[![zafirshi](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/53324602?v=4&w=50&h=50&mask=circle)](https://github.com/zafirshi)[![xhnmt](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/45755242?v=4&w=50&h=50&mask=circle)](https://github.com/xhnmt)

### ✨ Star History

[![Star History Chart](https://api.star-history.com/svg?repos=Adonis142857/GLaDOS-Signin&type=Date)](https://star-history.com/#Adonis142857/GLaDOS-Signin&Date)

