//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
//这是标准 ERC20 token接口的 Solidity 接口定义。接口不包含任何实现代码——它只指定函数和返回类型。
//创建IERC20接口
interface IERC20{
    function totalSupply() external view returns(uint256);//创建一个totalSupply()函数，返回代币的总供应量uint256。这个函数只有外部可见external，view只用于查阅不消耗gas

    function balanceOf(address account) external view returns(uint256);//创建balanceOf函数，查询目标地址的余额，需要传入查询的地址。返回类型为uint256的余额数字。

    function transfer(address account,uint256 amount ) external  returns(bool);//创建transfer()转账函数，传入要转去的地址account，和要转的代币数量amount。返回是否成功的bool值
     
    function approve(address account,uint256 amount) external returns(bool);//创建approve()授权其他地址使用该代币的函数，传入被授权的地址account,和授权的代币数量amount。
  
    function allowance(address account,address spender ) external view returns(uint256);//创建allowance()查询授权剩下的额度,传入原地址account，被授权的地址spender
    
    function transferFrom(address from,address to,uint256 amount) external returns(bool);//被授权方转账的方式，传入代币原地址account,要转去的目标地址to,和转账的代币数量

    event Approval(address indexed owner,address indexed spender,uint256 value);//返回授权事件，传入代币原地址，被授权方，和代币数量

    event Transfer(address indexed from,address indexed to,uint256 value);//返回转账事件，传入代币原地址，转入目标地址，和代币数量
}
   
