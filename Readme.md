FundMe Smart Contract
Overview
FundMe is a Solidity smart contract that allows users to fund a project with ETH, ensuring a minimum contribution equivalent to 5 USD. It uses Chainlink's price feed to convert ETH to USD in real-time. The contract owner can withdraw all funds securely. The project has been tested on an Ethereum testnet.
Features

Funding: Users can send ETH with a minimum contribution of 5 USD (converted using Chainlink price feeds).
Funder Tracking: Tracks contributors and their funding amounts using an array and mapping.
Withdrawal: Only the contract owner can withdraw funds, resetting the funder data afterward.
Price Conversion: Uses a separate PriceConvertor library to handle ETH to USD conversion.
Testnet Tested: Deployed and tested on an Ethereum testnet with MetaMask.

Prerequisites

Remix IDE: For compiling and deploying the smart contract.
MetaMask: To interact with the contract on an Ethereum testnet (e.g., Sepolia).
Testnet ETH: Obtain test ETH from a faucet for the chosen testnet.
Chainlink Price Feed: Uses the ETH/USD price feed at address 0x694AA1769357215DE4FAC081bf1f309aDC325306 (Sepolia testnet).

Setup

Clone the Repository:
Clone this repository to your local machine or load it into Remix IDE.


Open in Remix IDE:
Navigate to https://remix.ethereum.org.
Import the project files (FundMe.sol and PriceConvertor.sol) into Remix.


Compile the Contract:
Select Solidity compiler version ^0.8.18 in Remix.
Compile both PriceConvertor.sol and FundMe.sol.


Connect MetaMask:
Ensure MetaMask is installed and connected to a testnet (e.g., Sepolia).
Add the testnet to MetaMask and fund your wallet with test ETH.



Deployment

Deploy on Testnet:
In Remix, go to the Deploy & Run Transactions panel.
Select Injected Provider - MetaMask as the environment.
Deploy the FundMe contract. MetaMask will prompt you to confirm the transaction.


Verify Deployment:
Once deployed, note the contract address and verify it on the testnet explorer (e.g., Sepolia Etherscan).



Usage

Fund the Contract:
In Remix, interact with the deployed FundMe contract.
Call the fund function with an ETH amount (e.g., 0.003 ETH). Ensure the value meets the minimum USD requirement (5 USD).
MetaMask will prompt you to confirm the transaction.


Check Funder Data:
Use the funders array and addressToAmountFunded mapping to view contributors and their amounts.


Withdraw Funds (Owner Only):
If you're the contract owner, call the withdraw function to transfer all funds to your address.
Funder data will be reset after withdrawal.



Testnet Deployment Notes

Deployed on the Sepolia testnet.
Used Chainlink's ETH/USD price feed at 0x694AA1769357215DE4FAC081bf1f309aDC325306.
Tested funding with various ETH amounts and verified USD conversion.
Successfully withdrew funds as the owner, confirming the onlyOwner modifier.

Files

FundMe.sol: Main contract with funding and withdrawal logic.
PriceConvertor.sol: Library for ETH to USD price conversion using Chainlink.

License
This project is licensed under the MIT License - see the SPDX-License-Identifier in the source files for details.
