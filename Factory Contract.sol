//SPDX-License-Indentifier:MIT
pragma solidity ^0.8.0;

import './interfaces/IUniswapV2Factory.sol';
import './UniswapV2Pair.sol';

//创建UniswapV2Factory合约
contract UniswapV2Factory is IUniswapV2Factory{
  address public feeTO;//存储代币获得奖励的地址 
  address public feeToSetter;//有授权 权限的地址：有权更新获得奖励的地址
  //例如，在 Uniswap 协议中，feeTo地址设置为 Uniswap 治理合约，可以通过 feeToSetter 地址更新。
  //这允许治理合约随着时间的推移升级和维护协议。
  
  mapping(address => mapping(address=>address)) public getPair;
  //getPair：存储每个代币对的交易所地址
  //比如用tokenA 去兑换tokenB；(从左往右)第一个address 表示tokenA的地址；第二个address表示tokenB的地址；
  //第三个address 是处理代币A兑换代币B交易的 合约地址
  address[] public allPairs;
  //存储 流动性挖矿合约中所有可用的代币对；数组中的每个元素代表处理两个代币之间交易的合约地址
  //比如数组中第一个元素代表ETH/DAI代币对的兑换合约，数组的第二个元素代表ETH/USDC代币对的兑换合约
  //作用：追踪可用的代币对及其相应的交易合约，还可以通过使用相应的对ID对数字进行索引来查找特定代币对的交换合约
  
  event PairCreated(address indexed token0,address indexed token1,address pair,uint);
  //事件：token0和token1是构成token对的两个token，pair是处理两种代币之间交易的新交易合约的地址
  //uint是一个可选参数，可用于包含有关新token对或交易合约的附加信息
  
  constructor(address _feeToSetter)public{
    feeToSetter=_feeToSetter;
    }
  function allPairsLength() external view returns(uint){
    return allPairs.length;
    }
  function createPair(address tokenA, address tokenB)external returns(address pair){
  }
  }
