// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
/**
*@title FakeToken
*@dev ERC20 代币合约
 */

contract AFakeToken{
//代币名称
string public name = "AFakeToken";
//代币符号
string public symbol = "AFTK";
//保留多少位小数
uint8 public decimals = 2;
//发行总量
uint256 public totalSupply = 1000000;
//账户与余额
mapping(address=>uint256) private balances;
//账户允许其他账户使用代币数量
mapping(address=>mapping(address=>uint256)) private allowances;
//Token转移的时候触发
event Transfer(address indexed from,address indexed to,uint256 value);
//授权的时候触发
event Approval(address indexed owner,address indexed spender,uint256 value);

//构造函数，设置Token持有的初始账户为创建代币合约的账户
constructor(uint _unlockTime) payable{
    balances[msg.sender] = totalSupply;
}
/**
*@dev 查看指定账户还有多少Token
*@param owner 要查看的账户
*@return Token 数量 
*/
function balanceOf(address owner) public view returns (uint256){
    return balances[owner];
}
/**
*@dev 向指定账户转移Token
*@param toAddr 要转移Token的目标账户
*@param value 要转移的Token数量
*@return 是否转移成功
*/
// function transfer(address toAddr,uint256 value) public returns (bool){
//     require(balances[msg.sender] >= value);
//     balances[msg.sender] -= value;
//     balances[toAddr] += value;
//     emit Transfer(msg.sender, toAddr, value);
//     return true;
// }
/**
*@dev 从授权账户转移Token
*@param fromAddr 授权账户
*@param toAddr 目标账户
*@param value 要转移的Token数量
*@return 是否转移成功
*/
// function transferFrom(address fromAddr,address toAddr,uint256 value) public returns (bool){
//     require(balances[fromAddr] >= value);
//     require(allowances[fromAddr][msg.sender] >= value);
//     balances[fromAddr] -= value;
//     allowances[fromAddr][msg.sender] -= value;
//     balances[toAddr] += value;
//     emit Transfer(fromAddr, toAddr, value);
//     return true;
// }
/**
*@dev 授权给指定账户指定数量Token的使用权
*@param spender 要授权的账户
*@param value 要授权的Token数量
*@return 授权操作是否成功
*/
// function approve(address spender,uint256 value) public returns (bool){
//     allowances[msg.sender][spender] = value;
//     emit Approval(msg.sender, spender, value);
//     return true;
// }
/**
*@dev 查看指定账户还有多少授权Token可以使用
*@param owner 授权账户
*@param spender 被授权账户
*@return 可以使用Token数量
*/
function allowance(address owner,address spender) public view returns (uint256){
    return allowances[owner][spender];
}

}