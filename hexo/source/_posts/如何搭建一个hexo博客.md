---
title: 如何搭建一个hexo博客
date: 2025-04-06 18:35:14
tags: 博客搭建
---
## 如何用github actions搭建一个hexo的博客
以前用wordpress搭建了一个博客，那时候整了个学生机，开了6年，现在过期了，博客也没了，痛定思痛决定用github的github.io搭建一个博客

### 环境安装
#### 安装node
https://nodejs.org/zh-cn

#### 安装hexo
`npm install -g hexo-cli`

### hexo部署
安装 Hexo 完成后运行以下命令进行初始化
```
$ hexo init <folder>
$ cd <folder>
$ npm install
```

### github 配置
#### 新增repo
在GitHub新增一个repo，取名为同名的项目加上 .github.io 如下图
![alt text](/images/image.png)

新增完之后可以git clone下来在本地
`git clone https://github.com/ckj3134/ckj3134.github.io.git`

### 创建hexo项目

本地会有一个`ckj3134.github.io.git`目录
在目录下运行hexo命令行`hexo init hexo`
可以看到目录下多了一个hexo的文件夹
![alt text](/images/image-1.png)
文件夹中的格式如下
```
.
├── _config.yml
├── package.json
├── scaffolds
├── source
|   ├── _drafts
|   └── _posts
└── themes
```
### 通过github actions自动化部署hexo
进行settings页面进行actions>general将所有权限设置为有权限
![alt text](/images/image-2.png)

在进入pages页面，将source改成 github actions

#### 新增配置文件
github actions里面很明显要新增自己的workflow
![alt text](/images/image-3.png)

所以我们在目录下新增一个`.github/workflows/deploy.yml`的文件

我的`deploy.yml`的内容
```yml
name: Deploy Hexo Blog

on:
  push:
    branches:
      - main # 监听 main 分支的推送事件

jobs:
  build-deploy:
    runs-on: ubuntu-latest

    steps:
    # 检出代码
    - name: Checkout code
      uses: actions/checkout@v3

    # 初始化子模块
    - name: Initialize submodules
      run: git submodule update --init --recursive

    # 设置 Node.js 环境
    - name: Setup Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '16' # Hexo 推荐使用 Node.js 16

    # 进入 hexo 目录
    - name: Change directory to hexo
      run: cd hexo

    # 安装依赖
    - name: Install dependencies
      run: |
        cd hexo
        npm install

    # 生成静态文件
    - name: Build Hexo
      run: |
        cd hexo
        npx hexo generate

    # 在生成静态文件后添加
    - name: Disable Jekyll
      run: touch ./hexo/public/.nojekyll

    # 部署到 gh-pages 分支
    - name: Deploy to GitHub Pages
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./hexo/public
```
这样就完成自动化部署了

### 主题
我选择的主题是next
在目录下获取主题
`git https://github.com/theme-next/hexo-theme-next themes/next`

将它加到submoudle里面不然自动化部署的时候没有next的代码会报错
`git submodule add https://github.com/theme-next/hexo-theme-next themes/next`

### 参考文档
https://docs.github.com/zh/actions
https://hexo.io/zh-cn/docs/configuration