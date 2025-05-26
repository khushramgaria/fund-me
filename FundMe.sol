// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsd = 5e18;

    function fund() public payable {
        // Allow users to send $
        // Having a minimum $ sent
        require(getConversionRate(msg.value) > minimumUsd, "Didn't send enough ETH"); // 1e18 === 1 ETH
    }

    function getPrice() public view returns (uint256) {
        //Address  
        //ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionRate (uint256 ethAmount) public view returns (uint256) {
        // 1 ETH ?
        // if 1 ETH = 2000 USD then i get ethPrice as 2000_000000000000000000 WEI
        uint256 ethPrice = getPrice();
        // (2000_00000000000000000 * 1_000000000000000000) / 1e18
        // $2000 = 1ETH
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}