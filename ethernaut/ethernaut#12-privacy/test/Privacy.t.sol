// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Privacy.sol";

contract PrivacyTest is Test {
    Privacy public privacy;

    function setUp() public {
        bytes32[3] memory _data = [
            bytes32(uint256(0)),
            bytes32(uint256(1)),
            bytes32(uint256(2))
        ];
        privacy = new Privacy(_data);
    }

    function testUnlock() public {
        bytes16 key = bytes16(uint128(0));
        privacy.unlock(key);
        assertEq(privacy.locked(), false);
    }
}
