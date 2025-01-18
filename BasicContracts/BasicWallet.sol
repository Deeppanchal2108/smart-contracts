// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract BasicWallet{
    address public owner;
    constructor() {
        owner=msg.sender;
    }
    function deposit() public payable {}
    function withdraw(uint amount) public{
        require(owner==msg.sender,"Only owner can withdraw money");
        require(address(this).balance>= amount,"Not having enough balance");
        payable(owner).transfer(amount);

    } 

    function checkBalance() public  view returns (uint){
        return address(this).balance;
    }
}