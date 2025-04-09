---
title: 如何将 GitHub Pages博客绑定到自定义域名
date: 2025-04-07 00:09:29
tags: 博客搭建
---

# 如何将 GitHub Pages 博客绑定到自定义域名

这是一个简单的指南，帮助你将 GitHub Pages 生成的博客（例如 `ckj3134/ckj3134.github.io`）绑定到自定义域名（例如 `www.ckj3134.site`）。按照以下步骤操作，你将能够通过自定义域名访问你的博客，并且访客不会注意到它托管在 GitHub Pages 上。

<!-- more -->

## 前提条件
1. 你已经在 GitHub 上创建了一个博客（例如使用 Jekyll），并通过 GitHub Pages 部署，URL 为 `ckj3134/ckj3134.github.io`。
2. 你已经购买了一个自定义域名（例如 `www.ckj3134.site`），我是在腾讯云上购买的。

## 步骤

### 1. 在 GitHub 仓库中设置自定义域名
- 打开你的 GitHub 仓库（例如 `ckj3134/ckj3134.github.io`）。
- 点击顶部导航栏的 **Settings（设置）**。
- 在左侧菜单中，找到 **Pages（页面）** 部分。
- 在 **Custom domain（自定义域名）** 输入框中，输入你的域名（例如 `www.ckj3134.site`），然后点击 **Save（保存）**。
  - 保存后，GitHub 会自动在你的仓库根目录下创建一个 `CNAME` 文件，内容为你的域名（例如 `www.ckj3134.site`）。
- 如果你希望使用 `www` 子域名（例如 `www.ckj3134.site`），可以稍后在 DNS 设置中添加支持。

### 2. 配置域名提供商的 DNS 记录
你需要在域名提供商的 DNS 设置中添加记录，以将域名指向 GitHub Pages 的服务器。以下是推荐的配置：

#### A 记录（用于顶级域名，例如 `www.ckj3134.site`）
- 登录你的域名提供商的管理面板，找到 DNS 设置或区域文件编辑器。
- 添加以下四条 **A 记录**，将域名指向 GitHub Pages 的 IP 地址：

```
 主机名: @
  类型: A
  值: 185.199.108.153
  TTL: 3600（或默认值）
  主机名: @
  类型: A
  值: 185.199.109.153
  TTL: 3600（或默认值）
  主机名: @
  类型: A
  值: 185.199.110.153
  TTL: 3600（或默认值）
  主机名: @
  类型: A
  值: 185.199.111.153
  TTL: 3600（或默认值）
```
这是我的dns配置
![alt text](/images/image3.png)

#### CNAME 记录（可选，用于 `www` 子域名，例如 `www.mydomain.com`）
- 如果你希望支持 `www.mydomain.com`，添加以下 **CNAME 记录**：

```
  主机名: www
  类型: CNAME
  值: username.github.io.
  TTL: 3600（或默认值）
```

- **注意**：`username.github.io.` 是你的 GitHub Pages 默认域名，末尾的 `.` 是必需的。

### 3. 验证和等待 DNS 生效
- 保存 DNS 设置后，可能需要等待几分钟到 24 小时，让 DNS 记录全球传播（通常 10-30 分钟即可生效）。
- 在浏览器中输入 `ckj3134.site`，检查是否可以看到你的博客内容。
- 如果使用了 `www` 子域名，也测试 `www.ckj3134.site`。

### 4. 启用 HTTPS（可选但推荐）
- 返回 GitHub 仓库的 **Settings > Pages**。
- 在 **Custom domain** 下，勾选 **Enforce HTTPS**。
- GitHub 会自动为你的域名生成并应用免费的 SSL 证书，确保网站安全。

## 注意事项
- **不要删除 `CNAME` 文件**：如果通过 GitHub 设置页面添加了自定义域名，GitHub 会自动管理这个文件。如果你手动添加了 `CNAME` 文件，确保它位于仓库根目录，且只包含你的域名（例如 `ckj3134.site`）。
- 如果你的博客使用了 Jekyll，确保 Jekyll 配置正确（例如在 `_config.yml` 中设置 `url: "https://ckj3134.site"`）。
- 如果遇到问题，检查 DNS 设置是否正确，或等待更长时间以确保传播完成。

## 结果
完成以上步骤后，将通过 `ckj3134.site`（和/或 `www.mydomain.com`）提供服务，访客不会看到 `username.github.io` 的原始 URL。享受你的自定义域名博客吧！