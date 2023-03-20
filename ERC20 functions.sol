//SPDX-License-Indentifier:MIT
pragma solidity ^0.8.0;
//ERC20继承IERC20的所有属性和功能
contract ERC20 is IERC20{
  //变量定义。「在此contract中事先写定token的信息，如果不需要可直接把=“xxx”去掉即可」
  string public name="TalentedUs";//定义token全名name，可见性为public
  string public symbol="TDUS";//定义token简称symbol
  uint8 public decimals=18;//定义token精度decimals
  uint256 public totalSupply=1000000;//定义供应量totalSupply
  address public owner;//定义代币的所有方
  mapping(address=>uint256) public balanceOf;//定义查询余额的映射变量，根据addresss地址查到余额uint256
  mapping(address=>mapping(address=>uint256)) public allowance;//定义查询授权的额度，根据授权方address(第一个)映射到「被授权方address(第二个)映射到额度数量uint256」
  //设置合约的construct函数，当合约部署到区块链时调用。构造函数设置初始供应，将整个初始供应分配给合约部署者，并设置代币的名称、符号和小数单位。
  constructor()
}
