// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.8.0;
import "Guardian.sol";

contract GuardianContract {
    address private owner;
    address[] private guardians;

    bool private bsucceed;
    mapping (address => address) private guard;
    mapping (address => bool) private isMyguard;
    mapping (address => uint) private blockNumber;
    
    /* This function is executed at initialisation and sets the owner of the contract */
	constructor() { owner = msg.sender; }
	
	function checkGuardiansList (address g) public view returns (uint) {
        uint index = 10000;
        for (uint i = 0; i < guardians.length; i ++) {
            if (guardians[i] == g) {
                index = i;
                break;
            }
        }
        
        return index;
    }
    
    function setguardian(Guardian new_guard) public {
        bsucceed = false;
        address g = new_guard.getOwner();
        // Only the contract owner can call this function
        require(msg.sender == owner, "You are not the owner.");
        require(guardians.length > 5, "At most you can make 5 guardians per an account owner.");
    
        uint index = checkGuardiansList(g);
        require(index == 1000, "Have already added this guardian.");
        
        guard[owner] = g;
        isMyguard[g] = true;
        blockNumber[g] = block.timestamp + 4 weeks;
        guardians.push(g);
        bsucceed = true;
    }

    function updateOwner(Guardian new_owner) public {
        bsucceed = false;
        address g = new_owner.getOwner();
        require(isMyguard[g], "This is not allowed guardian.");
        require(blockNumber[g] >= block.timestamp , "Has exceed maximum timer limitation.");

        owner = g;
        uint index = checkGuardiansList(g);
        require(index == 10000);
        delete guardians[index];
        
        bsucceed = true;
    }

    function isSucceed () public view returns (bool) {
        return bsucceed;
    }
}