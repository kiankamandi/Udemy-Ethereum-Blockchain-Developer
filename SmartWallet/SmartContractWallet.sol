// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.34;

contract SmartWallet {
    address owner;
    mapping (address => uint) public addressAllowance;
    mapping (address => bool) public allowedUser;
    mapping (address => bool) public guardians;
    mapping (uint => mapping(address => bool)) hasVoted;
    mapping (uint => mapping(address => uint)) newOwnerVotes;
    uint public round;
    uint public constant confirmationThreshold = 3;
    address[5] guardianAddresses;
    
    constructor(address _owner) {
        owner = _owner;
    }

    function transfer(address payable _to, uint _amount, bytes calldata _calldata) public returns(bytes memory) {
        require((msg.sender == owner) || (allowedUser[msg.sender]),
                 "Only the owner and allowed users can transfer money.");
        require(address(this).balance >= _amount, "Not enough funds.");
        if (msg.sender != owner){
            require(addressAllowance[msg.sender] >= _amount, "The amount is out of limit.");
            addressAllowance[msg.sender] -= _amount;
        }
        
        (bool success, bytes memory returnData) = _to.call{value: _amount}(_calldata);
        require(success, "Transfer was unsuccessful.");
        return returnData;
    }
    function giveAllowance(address _user, uint _limit) public {
        require(msg.sender == owner, "Only the owner can give an allowance.");
        allowedUser[_user] = true;
        addressAllowance[_user] = _limit;
    }

    function setGaurdians(address[5] calldata _guardianAddresses) public {
        require(msg.sender == owner, "Only the owner can set the gaurdians.");
        for(uint8 i = 0; i < 5; i++){
            guardians[guardianAddresses[i]] = false;
        }
        for(uint8 i = 0; i < 5; i++){
            guardianAddresses[i] = _guardianAddresses[i];
            guardians[guardianAddresses[i]] = true;
        }
    }
    function setNewOwner(address _newOwnerAddress) public {
        require(guardians[msg.sender], "Only gaurdians are allowed to propose the new owner.");
        require(_newOwnerAddress != address(0), "Invalid owner address.");
        require(!hasVoted[round][msg.sender], "This address has already voted.");
        newOwnerVotes[round][_newOwnerAddress] ++;
        hasVoted[round][msg.sender] = true;

        if(newOwnerVotes[round][_newOwnerAddress] == confirmationThreshold){
            owner = _newOwnerAddress;
            round ++;
        }
    }
    receive() external payable {}

}

contract Consumer {
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    function deposit() public payable {}
}