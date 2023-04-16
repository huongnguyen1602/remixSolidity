// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract Test{
    function executeTransaction(
        address _add, bytes memory _data, uint _num
    ) public {
        (bool success, ) = payable (_add).call{value: _num}(
            _data
        );
        require(success, "tx failed");
    }
    receive() external payable {}
}

contract TestContract {
    uint public i;

    function callMe(uint j) public payable {
        i += j;
    }

    function getData() public pure returns (bytes memory) {
        return abi.encodeWithSignature("callMe(uint256)", 123);
    }
}