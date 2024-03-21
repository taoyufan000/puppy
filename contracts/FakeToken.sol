// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
/**
 *@title FakeToken
 *@dev ERC20 代币合约
 */

contract FakeToken {
    //代币名称
    string public name = "FakeToken";
    //代币符号
    string public symbol = "FTK";
    //保留多少位小数
    uint8 public decimals = 2;
    //发行总量
    uint256 public totalSupply = 1000000;

    address public owner; //初始值为0X000000000...

    //账户与余额
    mapping(address => uint256) private balances;
    //账户允许其他账户使用代币数量
    mapping(address => mapping(address => uint256)) private allowances;
    //冻结账户
    mapping(address => bool) public frozenAccount;
    //记录冻结账户
    event FrozenFunds(address target,bool frozen);
    //Token转移的时候触发
    event Transfer(address indexed from, address indexed to, uint256 value);
    //授权的时候触发
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    //销毁时触发
    event Burn(address indexed sender, uint256 value);

    //构造函数，设置Token持有的初始账户为创建代币合约的账户
    constructor(uint _unlockTime) payable {
        //定义一个构造函数，初始值为合约部署者的地址
        owner = msg.sender;
        balances[msg.sender] = totalSupply;
    }
    //定义一个修饰符，这个修饰符的意思是只能是合约部署者才能执行，其他地址的用户执行会抛出异常
    modifier onlyOwner() {
        require(msg.sender == owner, "you are not owner");
        _; //这行代表我们要引用方法的语句，写在什么位置，就在什么地方去执行
    }

    //定义一个修饰符，这个修饰符的意思是合约不能为空，否者抛出异常
    modifier Vali(address add) {
        require(add != address(0), "Not valid address");
        _;
    }

    /**
     *@dev 查看指定账户还有多少Token
     *@param owner 要查看的账户
     *@return Token 数量
     */
    function balanceOf(address owner) public view returns (uint256) {
        return balances[owner];
    }
    /**
     *@dev 向指定账户转移Token
     *@param toAddr 要转移Token的目标账户
     *@param value 要转移的Token数量
     *@return 是否转移成功
     */
    function transfer(address toAddr, uint256 value) public returns (bool) {
        require(balances[msg.sender] >= value);
        balances[msg.sender] -= value;
        balances[toAddr] += value;
        emit Transfer(msg.sender, toAddr, value);
        return true;
    }
    /**
     *@dev 从授权账户转移Token
     *@param fromAddr 授权账户
     *@param toAddr 目标账户
     *@param value 要转移的Token数量
     *@return 是否转移成功
     */
    function transferFrom(
        address fromAddr,
        address toAddr,
        uint256 value
    ) public returns (bool) {
        require(balances[fromAddr] >= value);
        require(allowances[fromAddr][msg.sender] >= value);
        balances[fromAddr] -= value;
        allowances[fromAddr][msg.sender] -= value;
        balances[toAddr] += value;
        emit Transfer(fromAddr, toAddr, value);
        return true;
    }
    /**
     *@dev 授权给指定账户指定数量Token的使用权
     *@param spender 要授权的账户
     *@param value 要授权的Token数量
     *@return 授权操作是否成功
     */
    function approve(address spender, uint256 value) public returns (bool) {
        allowances[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
    /**
     *@dev 查看指定账户还有多少授权Token可以使用
     *@param owner 授权账户
     *@param spender 被授权账户
     *@return 可以使用Token数量
     */
    function allowance(
        address owner,
        address spender
    ) public view returns (uint256) {
        return allowances[owner][spender];
    }
    /**
     *@dev 销毁代币
     */
    function burn(uint256 value) public returns (bool) {
        require(balances[msg.sender] >= value);
        balances[msg.sender] -= value;
        totalSupply -= value;
        emit Burn(msg.sender, value);
        return true;
    }
    /**
     *@dev 从其他账户销毁代币
     */
    function burnFrom(address fromAddr, uint256 value) public returns (bool) {
        require(balances[fromAddr] >= value);
        balances[fromAddr] -= value;
        allowances[fromAddr][msg.sender] -= value;
        totalSupply -= value;
        emit Burn(fromAddr, value);
        return true;
    }
    /**
     *@dev 添加Token
     */
    function mintToken(address target, uint256 mintedAmount) onlyOwner public{
        balances[target] += mintedAmount;
        totalSupply += mintedAmount;
        emit Transfer(address(0), owner, mintedAmount);
        emit Transfer(owner,target, mintedAmount);

    }
    /**
     *@dev 冻结账户
     */
    function freezeAccount(address target,bool freeze) onlyOwner public{
        frozenAccount[target] = freeze;
        emit FrozenFunds(target, freeze);
    }
    
}
