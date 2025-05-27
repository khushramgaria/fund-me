// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import  { PriceConvertor } from "./PriceConvertor.sol";

contract FundMe {

    using PriceConvertor for uint256;

    uint256 public constant minimumUsd = 5e18;
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        // Allow users to send $
        // Having a minimum $ sent
        require(msg.value.getConversionRate() > minimumUsd, "Didn't send enough ETH"); // 1e18 === 1 ETH
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner {
        // update the values to 0
        for(uint256 i = 0; i < funders.length; i++) {
            address funder = funders[i];
            addressToAmountFunded[funder] = 0;
        }

        //reset the array
        funders = new address[](0);

        //withdraw the funds
        // 3 ways

        // 1. transfer (automatic revert transaction if failed)
        // payable(msg.sender).transfer(address(this).balance);

        // // 2. send ( return bool if success or failed and not revert the transaction)
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // // to revert transaction instead of getting just bool
        // require(sendSuccess, "Send failed");

        // 3. call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed");
    }

    modifier onlyOwner {
        require(owner == msg.sender, "Only owner can withdraw !!");
        _;
    }
} 
