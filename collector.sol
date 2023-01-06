pragma solidity ^0.8.17;
// SPDX-License-Identifier: MIT

contract Collector{

    address public owner;
    uint256 public balance;

    constructor(){
        owner = msg.sender;

    }
    receive() payable external{
        balance += msg.value;
    }
    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender==owner, "Only Owner");
        require(amount<=balance,"Insufficient Balance");
        destAddr.transfer(amount);
        balance -= amount;
    }
}
