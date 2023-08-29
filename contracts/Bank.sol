// SPDX-License-Identifier: UNLICENCED
pragma solidity ^0.8.5;

import "./Ownable.sol";
import "./Destroyable.sol";


contract Bank is Ownable, Destroy {

    mapping(address => uint) public balance;

    event balanceAdded(uint amount, address depositedTo);

    function Deposit() public payable returns(uint) {
        balance[msg.sender] += msg.value;
        emit balanceAdded(msg.value, msg.sender);
        return balance[msg.sender];
    }

    function WithDraw(uint amount) public returns(uint) {
        require(balance[msg.sender] >= amount);
        payable(msg.sender).transfer(amount);
        balance[msg.sender] -= amount;
        return balance[msg.sender];
    }

    function CheckBalance() public view onlyOwner returns(uint) {
        return balance[msg.sender];
    }

    function TransferBalance(address receipent, uint amount) public onlyOwner{
        require(balance[msg.sender] >= amount, "you dont have enough balance.");
        require(msg.sender != receipent, "you are a sender and receiver both so its not possible.");
        payable(receipent).transfer(amount);  
        balance[msg.sender] -= amount;
        balance[receipent] += amount;
    }

    function TotalBalance() public view returns(uint) {
        return address(this).balance;
    }

    function getOwner() public view returns(address) {
        return owner;
    }
}