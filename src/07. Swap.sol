// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Swap {
    function swap(uint256 a, uint256 b) public pure returns (uint256, uint256) {
        a = a + b;
        b = a - b;
        a = a - b;
        return (a, b);
    }
}
