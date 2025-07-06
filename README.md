# 量化交易学习博客

这是一个记录量化交易学习过程的技术博客，基于Hexo框架构建，使用NexT主题。

## 📝 博客内容

### 当前文章
- **量化交易入门第一天：数据获取与处理实战** - 介绍CCXT库的使用、数据清洗和可视化技术

### 计划更新
- 第二天：双均线策略与回测
- 第三天：RSI指标策略实现
- 第四天：风险管理与仓位控制
- 第五天：多因子策略开发
- 第六天：期货与衍生品策略
- 第七天：实盘交易系统搭建

## 🛠 技术栈

- **框架**: Hexo 静态博客生成器
- **主题**: NexT 8.23.0
- **部署**: GitHub Pages
- **语言**: 中文
- **分析工具**: Python, CCXT, Pandas, Matplotlib

## 📁 项目结构

```
ckj3134.github.io/
├── hexo/                     # Hexo博客源码
│   ├── source/
│   │   ├── _posts/          # 博客文章
│   │   └── about/           # 关于页面
│   ├── themes/              # 主题文件
│   ├── _config.yml          # Hexo配置
│   └── _config.next.yml     # NexT主题配置
├── deploy.sh                # 自动化部署脚本
└── README.md               # 项目说明
```

## 🚀 快速开始

### 环境要求
- Node.js 12.0+
- Git
- SSH密钥配置

### 本地开发
```bash
# 克隆仓库
git clone git@github.com:ckj3134/ckj3134.github.io.git
cd ckj3134.github.io/hexo

# 安装依赖
npm install

# 启动本地服务器
hexo server
```

### 写作新文章
```bash
# 创建新文章
hexo new "文章标题"

# 编辑文章
# 文件位置: source/_posts/文章标题.md
```

### 部署博客
```bash
# 使用自动化脚本部署
./deploy.sh

# 或者手动部署
cd hexo
hexo clean
hexo generate
hexo deploy
```

## 🔧 配置说明

### Hexo配置 (_config.yml)
- **网站信息**: 标题、描述、作者
- **URL配置**: 设置为GitHub Pages地址
- **部署配置**: 使用git部署到gh-pages分支

### NexT主题配置 (_config.next.yml)
- **主题风格**: Pisces布局
- **功能增强**: 搜索、评论、数学公式支持
- **SEO优化**: 站点地图、meta标签

## 📊 博客统计

- **访问地址**: https://ckj3134.github.io
- **文章数量**: 8篇
- **分类**: 量化交易、Web3安全、博客搭建
- **标签**: Python、数据分析、加密货币等

## 🎯 学习目标

通过这个博客项目，我希望：
1. 系统学习量化交易理论和实践
2. 掌握Python在金融领域的应用
3. 分享学习过程和心得体会
4. 构建个人技术品牌

## 📚 参考资料

- [Hexo官方文档](https://hexo.io/docs/)
- [NexT主题文档](https://theme-next.js.org/)
- [CCXT官方文档](https://ccxt.readthedocs.io/)
- [量化交易学习资源](https://github.com/topics/quantitative-trading)

## 🤝 贡献

欢迎提出建议和反馈！如果你对量化交易感兴趣，可以：
- 提交Issue讨论问题
- 分享你的学习心得
- 推荐优质学习资源

## 📄 许可证

本项目采用MIT许可证 - 详见[LICENSE](LICENSE)文件

---

**⭐ 如果这个项目对你有帮助，请给个星星！**