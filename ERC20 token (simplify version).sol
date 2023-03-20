//SPDX-License-Indentifier:MIT
pragma solidity ^0.8.0;//0.8.0以上版本的solidity都可以兼容

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";//通过导入ERC20.sol，可以继承ERC20，并使用ERC20的功能
//创建一个名为TDUS的合约，并继承ERC20的所有属性和功能
contract TDUS is ERC20 {
  //
  constructor(uint256 initialSupply) ERC20("TalentedUs", "TDUS") {
  _mint(msg.sender, initialSupply); 
  }
  //该合约创建了一个TDUS代币，具有初始供应量initialSupply，并将所有初始供应量分配给合约创建者msg.sender
}
