// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SecondSolution {
    function whatIsTheMeaningOfLife() external pure returns (uint) {
        assembly {
            mstore(0x00, 0x2a)
            return(0x00, 0x20)
        }
    }
}
