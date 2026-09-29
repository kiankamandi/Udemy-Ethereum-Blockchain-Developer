// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0;

contract ContractOne {
    mapping (address => uint) public addressBalance;

    function deposit() public payable {
        addressBalance[msg.sender] += msg.value;
    }
}

contract ContractTwo {
    receive() external payable {}

    function depositOnContractOne(address _contract) public {
        ContractOne c1 = ContractOne(_contract); 
        c1.deposit{value:10, gas:100000}();
    }
    function depositOnContractOneLL(address _contract) public {
        bytes memory payload = abi.encodeWithSignature("deposit()");
        (bool success,) = _contract.call{value:10, gas:100000}(payload);
        require(success);
    }
}