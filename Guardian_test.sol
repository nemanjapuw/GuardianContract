// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "GuardianContract.sol";
import "Guardian.sol";

contract Guardian_test {
    GuardianContract guardian_contract;
    Guardian guardian1;
    Guardian guardian2;
    Guardian guardian3;
    
    function beforeAll () public {
        guardian_contract = new GuardianContract();
        guardian1 = new Guardian();
        guardian2 = new Guardian();
        guardian3 = new Guardian();
    }
    
    function checkSetGuardian () public returns (bool) {
        guardian_contract.setguardian(guardian1);
        guardian_contract.setguardian(guardian2);
        Assert.equal(guardian_contract.isSucceed(), true, "Operation has completed!");
        
        return guardian_contract.isSucceed();
    }
    
    function checkUpdateGuardian () public returns (bool) {
        guardian_contract.updateOwner(guardian3);
        Assert.equal(guardian_contract.isSucceed(), false, "Invalid guardian.");
        guardian_contract.setguardian(guardian3);
        guardian_contract.updateOwner(guardian3);
        Assert.equal(guardian_contract.isSucceed(), true, "Operation has completed!");
        
        return guardian_contract.isSucceed();
    }
}
