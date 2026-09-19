//SPDX-License-Identifier: MIT

pragma solidity 0.8.34;

// transfer function is replaced by call function. 
contract sendWithdrawMoney {
    uint public balanceReceived;

    function deposit() public payable {
        balanceReceived += msg.value;
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawAll() public {
        address payable to = payable(msg.sender);
        (bool success, ) = to.call{value:getContractBalance()}("");
        require(success, "Transfer is failed.");
    }

    function withdrawToAddress(address payable to) public {
        (bool success, ) = to.call{value:getContractBalance()}("");
        require(success, "Transfer is failed.");
    }
}