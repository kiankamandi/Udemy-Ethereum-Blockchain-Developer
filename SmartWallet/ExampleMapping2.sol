//SPDX-License-Identifier: MIT

pragma solidity 0.8.34;

contract ExampleMappingWithdrawals {
    mapping (address => uint) public balanceReceived;

    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    function withdrawAll(address payable _to) public {
        uint balanceAmount = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;

        (bool success, ) = _to.call{value:balanceAmount}("");
        require(success, "Transfer is failed.");
    }
}