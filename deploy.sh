#!/bin/bash

# 量化交易博客部署脚本
# 作者: ckj3134
# 用途: 自动化Hexo博客的生成、提交和部署

echo "🚀 开始部署量化交易博客..."

# 添加SSH密钥到SSH代理
echo "🔑 配置SSH密钥..."
ssh-add /Users/ccc/.ssh/id_ed25519_ckj3134

# 进入hexo目录
cd hexo

# 清理并重新生成静态文件
echo "🧹 清理并生成静态文件..."
hexo clean
hexo generate

# 部署到GitHub Pages
echo "📤 部署到GitHub Pages..."
hexo deploy

# 返回主目录
cd ..

# 提交源码更改
echo "💾 提交源码更改..."
git add .
git status

# 检查是否有更改需要提交
if ! git diff --quiet --cached; then
    echo "📝 发现更改，正在提交..."
    read -p "请输入提交信息: " commit_message
    if [ -z "$commit_message" ]; then
        commit_message="更新博客内容"
    fi
    git commit -m "$commit_message"
    git push origin main
    echo "✅ 源码更改已提交到GitHub"
else
    echo "ℹ️ 无需提交，所有更改已同步"
fi

echo "🎉 博客部署完成！"
echo "🌐 访问地址: https://ckj3134.github.io"
echo "⏱️ 请等待几分钟让GitHub Pages更新..." 