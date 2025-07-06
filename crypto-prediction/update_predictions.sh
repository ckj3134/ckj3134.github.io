#!/bin/bash

# 区块链币价预测更新脚本
# 设置路径
BLOG_DIR="/Users/ccc/Documents/code/ckj3134.github.io/hexo"
PREDICTION_DIR="/Users/ccc/Documents/code/btc_prophecy"
TARGET_DIR="$BLOG_DIR/source/crypto-prediction"

# 确保目标目录存在
mkdir -p $TARGET_DIR

# 设置时区为东八区（Asia/Shanghai）
export TZ=Asia/Shanghai

# 运行预测脚本
cd $PREDICTION_DIR
echo "运行比特币预测脚本..."
python btc_prophecy.py

echo "运行以太坊预测脚本..."
python eth_prophecy.py

# 复制预测结果到博客目录
echo "复制预测结果到博客目录..."
cp $PREDICTION_DIR/btc_prediction.png $TARGET_DIR/
cp $PREDICTION_DIR/eth_prediction.png $TARGET_DIR/
cp $PREDICTION_DIR/eth_predictions.csv $TARGET_DIR/

# 更新页面中的日期（使用东八区时间）
TODAY=$(date +%Y-%m-%d)
echo "当前东八区日期: $TODAY"
sed -i '' "s/date: [0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}/date: $TODAY/" $TARGET_DIR/index.md

# 生成博客
cd $BLOG_DIR
echo "生成博客..."
hexo clean && hexo generate

# 部署博客（如果使用hexo deploy）
# hexo deploy

echo "完成！预测结果已更新。" 