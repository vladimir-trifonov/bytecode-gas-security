// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/GatekeeperOne.sol";

contract Entrant {
    GatekeeperOne public gatekeeper;

    constructor(address _gatekeeper) {
        gatekeeper = GatekeeperOne(_gatekeeper);
    }

    function enter(bytes8 _gateKey) public returns (bool) {
        return gatekeeper.enter(_gateKey);
    }
}

contract GatekeeperOneTest is Test {
    GatekeeperOne public one;
    Entrant public entrant;

    function setUp() public {
        one = new GatekeeperOne();
        entrant = new Entrant(address(one));
    }

    function testEnter() public {
        bytes8 key = 0x0000000100001F38;
        assertTrue(entrant.enter{gas: 30314}(key));
    }
}
