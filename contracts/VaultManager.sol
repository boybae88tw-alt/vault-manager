// contracts/VaultManager.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 { function transferFrom(address, address, uint256) external returns (bool); }

contract VaultManager {
    mapping(address => mapping(address => uint256)) public balance;

    function deposit(address token, uint256 amt) external {
        IERC20(token).transferFrom(msg.sender, address(this), amt);
        balance[msg.sender][token] += amt;
    }
}
