// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasicToken{
    string public name="MyToken";
    string public symbol="MTK";
    uint8 public decimal=18;
    uint public totalSupply;

    mapping(address=>uint) balanceOf;
    event Transfer(address indexed from , address indexed to , uint value);

    constructor(uint _initialSupply){
        totalSupply=_initialSupply*10**decimal;
     balanceOf[msg.sender]=totalSupply;
    }

function transfer(uint _value, address _to ) public returns(bool){
    require(balanceOf[msg.sender]>=_value,"Not enough tokens");
    balanceOf[msg.sender]-=_value;
    balanceOf[_to]+=_value;
    emit Transfer(msg.sender, _to, _value);
    return true;
}
}