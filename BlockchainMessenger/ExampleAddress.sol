//SPDX-License-Identifier: MIT

pragma solidity 0.8.34;

contract ExampleAddress {
    address public addressVar;

    function getAddress(address _addressVar) public {
        addressVar = _addressVar;
    }
    function getBalance() public view returns(uint){
        return addressVar.balance;
    }
}