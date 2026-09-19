//SPDX-License-Identifier: MIT

pragma solidity 0.8.34;

contract TheBlockchainMessenger {
    string public message;
    address public owner;
    uint public counter;

    constructor() {
        owner = msg.sender;
    }
    
    function updateMessage (string memory _newMessage) public {
        if(msg.sender == owner){
            message = _newMessage;
            counter++;
        }
    }

}