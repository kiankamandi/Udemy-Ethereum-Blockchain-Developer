//SPDX-License-Identifier: MIT

pragma solidity 0.8.34;

contract ExampleViewPure {
    uint public storageVar;

    function getStorageVariable() public view returns(uint) {
        return storageVar;
    }
    function getAddition(int a, int b) public pure returns(int){
        return a+b;
    }
 
    function setStorageVariable(uint _newVar) public returns(uint) {
        storageVar = _newVar;
        return _newVar;
    }
}