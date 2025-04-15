// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    //State
    mapping (address => uint) private  storage_number;

    //Event
    event storageChanged(address, uint);

    //Constructor
    constructor() {
        emit storageChanged(msg.sender, 1234);
        storage_number[msg.sender] = 1234;// this is what will happen when someone calls the constructor on our contract. The first thing we do in a constructor is to set the initial value of our state variable so that everyone can access it at the same time.
    }

    //Functions
    function get() public view returns (uint) {
        return storage_number[msg.sender];
    }

    function set(uint value) public {
        storage_number[msg.sender] = value;
        emit storageChanged(msg.sender, value);
    }
}
