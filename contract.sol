// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract TokenErrorHandling {

    mapping(address => uint) public balances;

    constructor() {
        // Initial token distribution for demonstration
        balances[msg.sender] = 5000; // Assigning 5000 tokens to the contract deployer
    }

    // Function to withdraw tokens using require
    function withdrawWithRequire(uint amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
    }

    // Function to withdraw tokens using revert
    function withdrawWithRevert(uint amount) public {
        if (balances[msg.sender] < amount) {
            revert("Insufficient balance to withdraw");
        }
        balances[msg.sender] -= amount;
    }

    // Function to withdraw tokens using assert
    function withdrawWithAssert(uint amount) public {
        uint initialBalance = balances[msg.sender];
        balances[msg.sender] -= amount;
        assert(balances[msg.sender] == initialBalance - amount);
    }

    // Function to check the balance of the caller
    function checkBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
