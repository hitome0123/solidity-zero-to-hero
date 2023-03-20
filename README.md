# solidity-zero-to-hero
from web3 zero to web3 hero,line by line

# Project Title
It is a very easy way to learn solidity ,because I almost am a zero newbi.I will explain it in a very easy way in Chinese and English.
Liquidity Mining Like Uniswap
## Table of Contents

- [Getting Started](#getting-started)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Getting Started
Copy all and paste on the remix,compile and deploy.

At a high level, the Uniswap protocol consists of the following main contracts:

Factory Contract: This contract is responsible for deploying new exchange contracts for each token pair. It keeps track of all the exchange contracts that have been deployed and provides a function to create a new exchange contract for a given token pair.
      工厂合约：该合约负责为每个代币对部署新的交换合约。它跟踪所有已部署的交换合约，并提供为给定代币对创建新交换合约的功能。

Exchange Contract: This is the contract that handles the actual exchange of tokens. Each exchange contract is created for a specific token pair. It holds the balances of the tokens being traded and provides functions for users to buy and sell tokens.
交易合约：这是处理代币实际交易的合约。每个交换合约都是为特定的代币对创建的。它持有正在交易的代币余额，并为用户提供买卖代币的功能。

ERC20 Token Contract: This is the contract for the ERC20 token being traded on the Uniswap exchange. It is the standard interface for ERC20 tokens and provides functions to transfer tokens, check balances, and approve other accounts to spend tokens.
ERC20 代币合约：这是在 Uniswap 交易所交易的 ERC20 代币的合约。它是ERC20代币的标准接口，提供转账、查询余额、批准其他账户消费代币等功能。

Liquidity Pool Contract: This contract represents the pool of tokens that are used for liquidity provision. Users can add tokens to the pool in exchange for liquidity tokens that represent their share of the pool. The contract keeps track of the total value of the pool and provides functions for users to add or remove liquidity.
流动性池合约：该合约代表用于提供流动性的代币池。用户可以将代币添加到池中以换取代表他们在池中份额的流动性代币。合约跟踪池的总价值，并为用户提供添加或删除流动性的功能。

Uniswap Router Contract: This contract provides an interface for users to interact with the Uniswap protocol. It contains functions to swap tokens, add or remove liquidity, and get information about the state of the exchange.
Uniswap Router Contract：该合约为用户提供了与 Uniswap 协议交互的接口。它包含交换代币、添加或删除流动性以及获取有关交易所状态的信息的功能。

These contracts work together to provide a decentralized exchange where users can trade tokens and provide liquidity. Liquidity providers are incentivized to add liquidity to the pool through a system of liquidity mining rewards, where they receive a share of the trading fees generated by the exchange.



### Prerequisites

List any software or tools that need to be installed before getting started.

### Installation

Step-by-step instructions on how to install your project.

## Usage

Instructions on how to use your project.

## Contributing

Instructions on how others can contribute to your project.

## License

State the license for your project.
