// SPDX-License-Identifier: UNLICENCED
pragma solidity ^0.8.5;

contract Ownable {

    address internal owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(owner == msg.sender, "you are not the owner.");
        _;
    }
}