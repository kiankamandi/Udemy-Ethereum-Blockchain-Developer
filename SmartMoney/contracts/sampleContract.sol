//SPDX-License-Identifier: MIT

pragma solidity 0.8.34;

contract sampleContract {
    string public stringVar = "Hello World";

    function updateString(string memory _newString) public payable {
        if(msg.value == 1 ether){
            stringVar = _newString;
        } 
        else{
            payable(msg.sender).transfer(msg.value);
        }   
    }
}