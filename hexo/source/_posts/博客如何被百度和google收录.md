---
title: 博客如何被百度和google收录
date: 2025-04-06 19:04:51
tags:
---

# 如何让 GitHub Pages 生成的 Hexo 博客被百度和谷歌收录

## 前言
使用 GitHub Pages 搭建 Hexo 博客后，默认情况下搜索引擎不会立即收录你的博客。为了让百度和谷歌等搜索引擎更快地发现并收录你的博客，需要进行一些优化和配置。

---

## 1. 配置博客的 SEO

### 1.1 安装 Hexo SEO 插件
Hexo 提供了 `hexo-generator-seo-friendly-sitemap` 和 `hexo-generator-baidu-sitemap` 插件，用于生成适合搜索引擎的站点地图。

#### 安装插件
在 Hexo 项目根目录下运行以下命令：
```bash
npm install hexo-generator-seo-friendly-sitemap hexo-generator-baidu-sitemap --save
```

#### 配置 Sitemap
在 Hexo 项目的 `_config.yml` 文件中添加以下配置：
```markdown
# Sitemap 配置
sitemap:
  path: sitemap.xml

baidusitemap:
  path: baidusitemap.xml
```

#### 配置 Meta 标签
在 Hexo 的主题配置文件（如 themes/next/_config.yml）中，确保启用了 SEO 相关的 Meta 标签：
```markdown
seo:
  enable: true
```

---

## 2. 配置 robots.txt 文件

在博客的根目录下创建一个 `robots.txt` 文件，并添加以下内容：
```markdown
User-agent: *
Allow: /
Sitemap: https://ckj3134.github.io/sitemap.xml
```

## 3.优化博客内容
### 3.1 使用友好的 URL
在 _config.yml 中配置友好的 URL：
`permalink: :year/:month/:day/:title/`

## 4.提交站点地图
### 4.1 提交到百度
登录 [百度搜索资源平台](http://ziyuan.baidu.com/)。
添加你的博客网址（如 https://ckj3134.github.io）。
在 链接提交 > 自动提交 中，提交 baidusitemap.xml 的地址（如 https://ckj3134.github.io/baidusitemap.xml）。
### 4.2 提交到谷歌
登录 [Google Search Console](https://search.google.com/search-console/)。
添加你的博客网址（如 https://ckj3134.github.io）。
在 Sitemaps 中，提交 sitemap.xml 的地址（如 https://ckj3134.github.io/sitemap.xml）。