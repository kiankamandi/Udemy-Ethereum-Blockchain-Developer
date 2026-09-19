//SPDX-License-Identifier: MIT

pragma solidity 0.8.34;

contract ExampleUint {
    uint public uintVar; //uint = uint256
    uint8 public uintVar8 = 250;
    int public intVar = -2;

    function setUintVar (uint _uintVar) public {
        uintVar = _uintVar;
    }
    function incrementUint8() public {
        uintVar8 ++;
    }
    function incrementInt() public{
        intVar ++;
    }
    function decrementUint() public {
        uintVar --;
    }
}