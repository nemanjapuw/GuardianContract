// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.

contract Guardian {
    address private owner;
    constructor() {
        owner = address(this);
    }
    
    
    function getOwner () public view returns (address) {
        return owner;
    }
}
