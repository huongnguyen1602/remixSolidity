// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract TestOnlyOwner{
    uint public nun;
    address public owner;
    constructor(){
        owner = 0x5e95Ed9d49875bCa8a0fe8e0d61bEC8DD4109951;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    function increaOne() public onlyOwner {
        nun +=1;
    }
}
