// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./IERC20.sol"; // sữ dụng interface 

contract ERC20 is IERC20 {
    uint public totalSupply;
    mapping(address => uint) public balanceOf; 
    // mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;
    // mapping(address => mapping(address => uint))
    string public name = "Solidity by Example"; //optional
    string public symbol = "SOLBYEX";
    uint8 public decimals = 18; 

    function transfer(address recipient, uint amount) external returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }
    // số lượng này ở đâu ra: truyền vào contract và lưu số lượng? do người khởi tạo contract mint,
    // swap và truyền nó sang địa chỉ khác.

    function approve(address spender, uint amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom( //chuyển tiền trong khoản tiền chi tiêu. người gửi ko nhất thiết gọi hàm này
        address sender,
        address recipient,
        uint amount
    ) external returns (bool) {
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }
    // chuyển tiền theo kiểu ủy quyền.



    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }


    function burn(uint amount) external { // burn của người gửi một số 
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }


}
