---
title: Ethernaut 第0关-Hello Ethernaut 解题指南
date: 2025-04-08 00:55:16
tags:
  - web3
  - 安全
---

# Ethernaut 第 0 关 - Hello Ethernaut 解题指南

Ethernaut 是 OpenZeppelin 提供的 Web3/Solidity 战游戏，通过“黑客”智能合约帮助学习以太坊安全知识。第 0 关“Hello Ethernaut”是一个入门关卡，旨在让玩家熟悉游戏界面和基本合约交互。本指南详细解释如何解决关卡 [https://ethernaut.openzeppelin.com/level/0x7E0f53981657345B31C59aC44e9c21631Ce710c7](https://ethernaut.openzeppelin.com/level/0x7E0f53981657345B31C59aC44e9c21631Ce710c7)，并提供完整步骤。

<!-- more -->

## 前提条件
- 安装并配置 [Metamask](https://metamask.io/)，连接到 Sepolia 测试网。
- 从 [Sepolia Faucet](https://sepoliafaucet.com/) 获取测试网 ETH。
- 访问 [Ethernaut 官网](https://ethernaut.openzeppelin.com/) 并生成新实例。

## 关卡目标
通过一系列函数调用找到密码，并调用 `authenticate` 函数完成认证。密码通常为“ethernaut0”，但可能因实例不同而变，需通过 `password()` 函数确认。

## 解决步骤

### 1. 环境设置
- 确保 Metamask 已连接到 Sepolia 测试网并有足够的 ETH。
- 在 Ethernaut 第 0 关页面点击“生成新实例”，获取一个唯一的合约地址。
- 打开浏览器开发者工具（F12），切换到 Console 标签以交互。

### 2. 逐步交互
在 Dev Console 中按以下顺序调用函数，跟随提示找到密码：

- **调用 `info()`**：
  ```javascript
  await contract.info()
  ```
  - 返回：“You will find what you need in info1().”
  - 行动：调用 `info1()`。

- **调用 `info1()`**：
  ```javascript
  await contract.info1()
  ```
  - 返回：“Try info2(), but with 'hello' as a parameter.”
  - 行动：调用 `info2("hello")`。

- **调用 `info2("hello")`**：
  ```javascript
  await contract.info2("hello")
  ```
  - 返回：“The property infoNum holds the number of the next info method to call.”
  - 行动：调用 `infoNum()`。

- **调用 `infoNum()`**：
  ```javascript
  await contract.infoNum()
  ```
  - 返回：42
  - 行动：调用 `info42()`。

- **调用 `info42()`**：
  ```javascript
  await contract.info42()
  ```
  - 返回：“theMethodName is the name of the next method.”
  - 行动：调用 `theMethodName()`。

- **调用 `theMethodName()`**：
  ```javascript
  await contract.theMethodName()
  ```
  - 返回：“The method name is method7123949.”
  - 行动：调用 `method7123949()`。

- **调用 `method7123949()`**：
  ```javascript
  await contract.method7123949()
  ```
  - 返回：“If you know the password, submit it to authenticate().”
  - 行动：调用 `password()` 获取密码。

- **调用 `password()`**：
  ```javascript
  await contract.password()
  ```
  - 返回：密码（如“ethernaut0”）。

- **完成认证**：
  使用获取的密码调用 `authenticate`：
  ```javascript
  await contract.authenticate("ethernaut0")
  ```
  - 如果密码正确，关卡完成，页面会提示成功。

### 3. 验证完成
- 调用 `isCleared()` 检查状态：
  ```javascript
  await contract.isCleared()
  ```
  - 返回 `true` 表示成功。

## 注意事项
- **密码可能不同**：每次生成新实例时，密码可能变化，务必通过 `password()` 获取。
- **异步调用**：所有函数调用需使用 `await`，确保在 Console 中正确执行。
- **网络确认**：提交 `authenticate` 后，等待交易确认（可能需要几秒）。

## 合约代码参考
以下是关卡的简化合约代码，帮助理解逻辑：
```solidity
contract Instance {
    string public password;
    uint8 public infoNum = 42;
    string public theMethodName = 'The method name is method7123949.';
    bool private cleared = false;

    constructor(string memory _password) {
        password = _password;
    }

    function info() public pure returns (string memory) { return 'You will find what you need in info1().'; }
    function info1() public pure returns (string memory) { return 'Try info2(), but with "hello" as a parameter.'; }
    function info2(string memory param) public pure returns (string memory) { return 'The property infoNum holds the number of the next info method to call.'; }
    function infoNum() public view returns (uint8) { return infoNum; }
    function info42() public view returns (string memory) { return 'theMethodName is the name of the next method.'; }
    function theMethodName() public view returns (string memory) { return theMethodName; }
    function method7123949() public view returns (string memory) { return 'If you know the password, submit it to authenticate().'; }
    function password() public view returns (string memory) { return password; }
    function authenticate(string memory _password) public { if (keccak256(abi.encodePacked(_password)) == keccak256(abi.encodePacked(password))) cleared = true; }
    function isCleared() public view returns (bool) { return cleared; }
}
```

## 结果
完成以上步骤后，你将成功通过 Ethernaut 第 0 关，学会如何通过 Dev Console 与智能合约交互，为后续关卡打下基础。

## 资源与参考
- [Ethernaut 官网](https://ethernaut.openzeppelin.com/)
- [HackMD 解题指南](https://hackmd.io/%400xbc000/ryToeKj4a)
- [Metamask 官网](https://metamask.io/)
- [Sepolia Faucet](https://sepoliafaucet.com/)