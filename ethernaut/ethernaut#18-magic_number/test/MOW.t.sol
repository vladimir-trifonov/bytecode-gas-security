// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MOW.sol";

contract MOWTest is Test {
    MOW public mow;

    function setUp() public {
        mow = new MOW();
    }

    function testMOW() public {
        bytes32 res = bytes32(
            0x000000000000000000000000000000000000000000000000000000000000002a
        );
        (bool ok, bytes memory result) = address(mow).call(
            abi.encodeWithSignature("whatIsTheMeaningOfLife()")
        );
        assertTrue(ok);
        assertEq(abi.encodePacked(bytes32(result)), abi.encodePacked(res));

        uint256 size;
        assembly {
            size := extcodesize(sload(mow.slot))
        }
        assertEq(size, 10);
    }
}
