// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/IERC20.sol
interface IERC20 {
    function totalSupply() external view returns (uint);

    function balanceOf(address account) external view returns (uint);

    function transfer(address recipient, uint amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}
//ERC20继承IERC20的所有属性和功能
contract ERC20 is IERC20{
  //变量定义。「在此contract中事先写定token的信息，如果不需要可直接把=“xxx”去掉即可」
  string public name="TalentedUs";//定义token全名name，可见性为public
  string public symbol="TDUS";//定义token简称symbol
  uint8 public decimals=18;//定义token精度decimals
  uint public totalSupply;//定义供应量totalSupply
  address public owner;//定义代币的所有方
  mapping(address=>uint256) public balanceOf;//定义查询余额的映射变量，根据addresss地址查到余额uint256
  mapping(address=>mapping(address=>uint256)) public allowance;//定义查询授权的额度，根据授权方address(第一个)映射到「被授权方address(第二个)映射到额度数量uint256」
  //设置合约的construct函数，当合约部署到区块链时调用。构造函数设置初始供应，将整个初始供应分配给合约部署者，并设置代币的名称、符号和小数单位。
  constructor(){
  owner=msg.sender;}//代币的所有者是合约的发起地址
  //当合约被部署到区块链时，这个构造函数只会被调用一次。通过将owner变量设置为消息发送者的地址，合约的所有者将是部署合约的帐户。这是在以太坊智能合约中设置合约所有者的常见模式。
  
  modifier onlyOwner(){
        require(msg.sender == owner, "Only owner can mint");
        _;}
  
  //转账函数 传入收款地址，金额 ，返回bool
  function transfer(address recipient,uint256 amount) external returns(bool){
    balanceOf[msg.sender]-=amount;//发起方金额减少
    balanceOf[recipient]+=amount;//接收方金额增加
    emit Transfer(msg.sender,recipient,amount);//返回转账事件，三个参数，发起方，接收方，数量
    return true;  //返回bool
  }
  //授权函数
  function approve(address recipient,uint256 amount)external returns(bool){
    allowance[msg.sender][recipient]=amount;//查询授权额度，格式为allowance[发起方地址][接收方地址]
    emit Approval(msg.sender,recipient,amount);//返回授权事件，三个参数，发起方，接收方，数量
    return true;
    }
  //授权方转账函数
  function transferFrom(address sender,address recipient,uint256 amount )external returns(bool){
     balanceOf[sender]-=amount;
     balanceOf[recipient]+=amount;
     emit Transfer(sender,recipient,amount);
     return true;
    }
//铸造token函数
function mint(uint256 amount) external onlyOwner(){
  balanceOf[msg.sender]+=amount;
  totalSupply+=amount;
  emit Transfer(address(0),msg.sender,amount);
  }
 //销毁token函数
 function burn(uint256 amount)external onlyOwner(){
  balanceOf[msg.sender]-=amount;
  totalSupply-=amount;
  emit Transfer(msg.sender,address(0),amount);}
  
}
