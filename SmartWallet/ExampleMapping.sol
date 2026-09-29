//SPDX-License-Identifier: MIT

pragma solidity 0.8.34;

contract ExampleMapping {
    mapping (uint => bool) public myMapping;
    mapping (address => bool) public myAddressMapping;
    // Nested Mapping
    mapping (uint => mapping(uint => bool)) public uintUintBoolMap;

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }
    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }
    function setUintUintBoolMap(uint _key1, uint _key2, bool _value) public{
        uintUintBoolMap[_key1][_key2] = _value;
    }
}