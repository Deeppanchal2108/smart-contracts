// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserManagement {
    struct User {
        string name;
        uint256 id;
        uint256 age;
    }
    User[] private users;
    uint256 private index = 1;

    function addUser(string memory name, uint256 age) public {
        users.push(User(name, index, age));
        index++;
    }

    function getUser(uint256 id) public view returns (User memory) {
        for (uint256 i = 0; i < users.length; i++) {
            if (users[i].id == id) {
                return users[i];
            }
        }
        revert("User not found ");
    }

    function  updateUser(string memory name, uint256 age , uint id) public{
   for (uint256 i = 0; i < users.length; i++) {
            if (users[i].id == id) {
                users[i].name=name;
                 users[i].age=age;
                return;
            }
        }
        revert("User not found ");
    }


    function deleteUser(uint256 id) public {
        for (uint256 i = 0; i < users.length; i++) {
            if (users[i].id == id) {
                users[i] = users[users.length - 1];
                users.pop();
                return;
            }
        }
        revert("User not found ");
    }
    function getTotalUsers() public  view  returns(uint){
        return users.length;
    }
}
