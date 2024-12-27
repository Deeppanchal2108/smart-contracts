// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBanking {
    address public owner;
    mapping(address => uint256) public balances;
    event Deposit(address indexed user, uint256 amount);
    event Withdrawel(address indexed user, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Insufficent balance");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
    function checkBalance() public  view  returns (uint){
        return balances[msg.sender];
    }
    function withdraw(uint amount) public {
        require(amount<=balances[msg.sender],"not having enough amount");
        balances[msg.sender]-=amount;
        payable(msg.sender).transfer(amount);
        emit Withdrawel(msg.sender, amount);
    }

}
