# Simple Storage 📦🔐

A basic Solidity smart contract that demonstrates how to store, update, and retrieve an unsigned integer value on the Ethereum blockchain.

## 🚀 What It Does

This smart contract allows users to:
- Store a single `uint` value
- Update the stored value
- Retrieve the stored value via a public function

## 💡 Why It’s Useful

This is one of the most fundamental patterns in Solidity — understanding how to manage and persist data on the blockchain. It’s perfect for learning:
- State variables
- Public functions
- Transactions vs. calls

## 🛠️ How to Use

You can try this out in [Remix IDE](https://remix.ethereum.org/):

### 1. Copy the Contract Code

```solidity
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

