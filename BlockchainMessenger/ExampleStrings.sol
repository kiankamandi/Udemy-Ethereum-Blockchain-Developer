//SPDX-License-Identifier: MIT

pragma solidity 0.8.34;

contract ExampleStrings {
    string public strVar = "Hello World!";
    bytes public bytesVar = "Hello World!";

    function setStrVar(string memory _strVar) public {
        strVar = _strVar;
    }
    function compareTwoStrings(string memory _strVar) public view returns (bool){
        return keccak256(abi.encodePacked(strVar)) == keccak256(abi.encodePacked(_strVar));
    }
    function getBytesLength() public view returns(uint) {
        return bytesVar.length;
    }
}