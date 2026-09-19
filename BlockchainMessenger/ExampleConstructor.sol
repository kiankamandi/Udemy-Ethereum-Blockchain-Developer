//SPDX-License-Identifier: MIT

pragma solidity 0.8.34;

contract ExampleConstructor{
    address public addressVar;

    function setAddressVar(address _addressVar) public {
        addressVar = _addressVar;
    }
    function setAddressVarToMsgSender() public {
        addressVar = msg.sender;
    }
}