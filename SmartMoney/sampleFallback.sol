//SPDX-License-Identifier: MIT

pragma solidity 0.8.34;

contract sampleFallback{
    uint public lastValueSent;
    string public lastFunctionCalled;
    uint public uintVar;

    function setUintVar(uint _newUintVar) public {
        uintVar = _newUintVar;
    }

    receive() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
    }

    fallback() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }

}
