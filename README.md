README.md — MyToken (MTK)
Overview

MyToken (MTK) is a simple ERC-20 compatible token created for learning purposes on the Ethereum blockchain.
It demonstrates essential ERC-20 features such as transfers, approvals, allowances, and event emission.

Token Details

Name: MyToken

Symbol: MTK

Decimals: 18

Total Supply: 1,000,000 MTK (minted at deployment and assigned to the deployer)

Features

Standard ERC-20 implementation

Transfer tokens between addresses

Approve another account to spend tokens

transferFrom functionality for delegated transfers

Emits Transfer and Approval events

Tracks balances and allowances

Deployment Instructions (Remix IDE)

Open Remix IDE: https://remix.ethereum.org

Create a new file named MyToken.sol

Paste the full Solidity contract code

Open the Solidity Compiler tab and select version 0.8.x

Click "Compile MyToken.sol"

Open the Deploy & Run Transactions tab

Select "JavaScript VM" as the environment

Enter initial supply (for example: 1000000)

Click "Deploy"

The deployed contract will appear under "Deployed Contracts"

How to Use the Token
Check Balance
balanceOf(address account)

Transfer Tokens
transfer(address to, uint256 amount)

Approve a Spender
approve(address spender, uint256 amount)

Spend Tokens on Behalf of Another User
transferFrom(address from, address to, uint256 amount)

Events
event Transfer(address indexed from, address indexed to, uint256 value);
event Approval(address indexed owner, address indexed spender, uint256 value);

Testing Summary
Basic Functionality

balanceOf returns correct initial supply

name, symbol, and decimals work as expected

Transfer Tests

Valid transfers succeed

Transfer to zero address reverts

Transfer exceeding balance reverts

Approve and transferFrom Tests

approve sets allowance correctly

transferFrom works after approval

transferFrom without approval reverts

Edge Cases

Zero-address transfer prevented

Overspending prevented

Unauthorized transferFrom prevented

Conclusion

MyToken implements all required ERC-20 functions and behaviors.
The contract compiles successfully, deploys on Remix, and passes all functional and edge-case tests.
