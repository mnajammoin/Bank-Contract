// SPDX-License-Identifier: UNLICENCED
pragma solidity ^0.8.5;
import "./Ownable.sol";

contract Destroy is Ownable {

    function ShutDown() public onlyOwner {
        selfdestruct (payable(msg.sender));
    }
}