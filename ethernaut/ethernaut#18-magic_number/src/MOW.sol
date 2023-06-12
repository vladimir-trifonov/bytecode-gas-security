// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract MOW {
    constructor() {
        assembly {
            // Store bytecode at to mem position 0
            mstore(0x00, 0x602A60005260206000F3)
            return(0x16, 0x0a)
        }
    }
}
