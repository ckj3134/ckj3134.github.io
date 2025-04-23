---
title: Ethernaut第2关-fallout解题指南
date: 2025-04-10 00:06:17
tags:
  - web3
  - 安全
---

# Ethernaut 第 2 关 - Fallout 解题指南（使用 Remix）

Ethernaut 是 OpenZeppelin 提供的 Web3/Solidity 战游戏，通过“黑客”智能合约帮助学习以太坊安全知识。第 2 关“Fallout”是一个基础关卡，旨在让玩家理解构造函数漏洞。本指南使用 [Remix IDE](https://remix.ethereum.org/) 解决关卡 [https://ethernaut.openzeppelin.com/level/0x676e57FdBbd8e5fE1A7A3f4Bb1296dAC880aa639](https://ethernaut.openzeppelin.com/level/0x676e57FdBbd8e5fE1A7A3f4Bb1296dAC880aa639)，确保 `owner` 是你的 Metamask 地址。

<!-- more -->

## 前提条件
- 安装并配置 [Metamask](https://metamask.io/)，连接到 Sepolia 测试网。
- 从 [Sepolia Faucet](https://sepoliafaucet.com/) 获取测试网 ETH。
- 访问 [Ethernaut 官网](https://ethernaut.openzeppelin.com/) 并生成新实例。

## 关卡目标
- 成为合约的 `owner`，确保 `owner` 是你的 Metamask 地址。

## 解决步骤

### 1. 准备环境
- 打开 [Remix IDE](https://remix.ethereum.org/)。
- 确保 Metamask 连接到 Sepolia 测试网并有足够 ETH。
- 在 Ethernaut 第 2 关页面生成新实例，记录合约地址（例如 `0xYourInstanceAddress`）。

### 2. 定义目标合约接口
- 在 Remix 中创建文件 `FalloutInterface.sol`，输入以下代码：
  ···solidity
  // SPDX-License-Identifier: MIT
  pragma solidity ^0.6.0;

  interface IFallout {
      function Fal1out() external payable;
      function owner() external view returns (address);
  }
  ···
- 编译接口（版本 `0.6.0`）。

### 3. 直接调用 `Fal1out()`
- 在 Remix “Deploy & Run Transactions” 面板：
  - 环境选择 `Injected Web3`（连接 Metamask）。
  - 在 “At Address” 字段输入目标合约地址，选择 `IFallout` 接口。
  - 调用 `Fal1out()`，在 “Value” 字段输入 `0.001 ether`（可选），点击“transact”并通过 Metamask 确认。
- 这将直接从你的 Metamask 地址调用，设置 `owner` 为你的地址。

### 4. 验证结果
- 调用 `owner()` 检查：
  - 在 Remix 使用 `IFallout` 接口，点击 `owner`，确认返回你的 Metamask 地址。
- 或在浏览器 Console 检查：
  ···javascript
  await contract.owner()
  ···
- 在 Ethernaut 页面点击“Submit Instance”验证。

## 注意事项
- **调用者**：必须直接从 Metamask 调用 `Fal1out()`，避免通过攻击合约间接调用。
- **版本匹配**：使用 `^0.6.0` 与目标合约一致。
- **Gas 费用**：确保有足够 ETH 支付交易费用。

## 合约代码参考
以下是目标合约的简化代码：
···solidity
contract Fallout {
    mapping (address => uint) allocations;
    address payable owner;

    function Fal1out() public payable {
        owner = payable(msg.sender);
        allocations[owner] = msg.value;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }
}
···

## 结果
通过 Remix 直接调用 `Fal1out()`，你成功将 `owner` 设置为你的 Metamask 地址，完成第 2 关。这一方法避免了攻击合约导致的 `owner` 错误。

## 资源与参考
- [Ethernaut 官网](https://ethernaut.openzeppelin.com/)
- [Remix IDE](https://remix.ethereum.org/)
- [Metamask 官网](https://metamask.io/)
- [Sepolia Faucet](https://sepoliafaucet.com/)