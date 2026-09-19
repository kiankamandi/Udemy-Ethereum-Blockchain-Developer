//SPDX-License-Identifier: MIT

pragma solidity 0.8.34;

contract ExampleMsgSender {

    address public someAddress;

    function updateSomeAddress() public {
        /*
        msg.sender contains the address of the account or contract that directly called
        the current smart contract/function.
        */
        someAddress = msg.sender;
    }
}