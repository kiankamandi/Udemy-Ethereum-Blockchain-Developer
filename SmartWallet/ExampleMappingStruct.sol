// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.34;

contract MappingStructExample {
    struct Transaction {
        uint amount;
        uint timestamp;
    }
    struct Balance {
        uint totalBalance;
        uint numDeposits;
        mapping (uint => Transaction) depositTxs;
        uint numWithdrawals;
        mapping (uint => Transaction) withdrawalTxs;
    }

    mapping (address => Balance) public balance;

    function depositMoney() public payable {
        balance[msg.sender].totalBalance += msg.value;

        Transaction memory deposit =  Transaction(msg.value, block.timestamp);
        balance[msg.sender].depositTxs[balance[msg.sender].numDeposits] = deposit;
        balance[msg.sender].numDeposits ++;
    }
    function withdrawMoney(address payable _to, uint _amount) public {
        balance[msg.sender].totalBalance -= _amount;
        Transaction memory withdrawal = Transaction(_amount, block.timestamp);
        balance[msg.sender].withdrawalTxs[balance[msg.sender].numWithdrawals] = withdrawal;
        balance[msg.sender].numWithdrawals ++;
        (bool success, ) = _to.call{value:_amount}("");
        require(success, "Transfer is failed.");
    }

}