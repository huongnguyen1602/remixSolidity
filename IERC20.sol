// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/IERC20.sol
// mỗi con tract theo ERC20 là một token
interface IERC20 {
    function totalSupply() external view returns (uint); //số lượng 

    function balanceOf(address account) external view returns (uint); // số lượng của một address

    function transfer(address recipient, uint amount) external returns (bool); // transfer từ account gọi 

    function allowance(address owner, address spender) external view returns (uint); // trích một lượng cho phép để giao dịch
    //với accoutn khác

    function approve(address spender, uint amount) external returns (bool); // dùng để apply số lượng ttrong allowaance

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool); // chuyển tiền trong allowance

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}
