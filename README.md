# MyToken Smart Contract

This is a Solidity smart contract written to create an ERC20 token called MyToken (MTF). The contract inherits @openzeppelin/contracts/token/ERC20/ERC20.sol. It includes functionalities for minting, burning, and transferring tokens. It is designed to be deployed on the Ethereum blockchain.


## Features

1. Minting: The contract owner can mint new tokens and assign them to a specified address.
2. Burning: Any user can burn their own tokens, reducing the total supply.
3. Transferring: Users can transfer tokens to another address.
4. ERC20 Compatibility: The contract adheres to the ERC20 standard, ensuring compatibility with existing Ethereum tools and services.


### Executing program

To deploy the contract, follow these steps:

You can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., MyToken.sol). Copy and paste the contract code into the file



To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "Compile MyToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MyToken" contract from the dropdown menu, and pick any environment of your choice you will like to deploy to.
You should interact on remix local environment or pick injected provider to deploy to either testnet or mainnet (this is at a cost). It is important you know what you're doing to deploy to mainnet.

To deploy click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling it functions.


### Usage

Constructor
Upon deployment, the constructor function initializes the token with the name "MyToken" and the symbol "MTF". It also mints an initial supply of 1,000,000,000 tokens to the deployer's address.

Minting
The mint function allows the contract owner to mint new tokens and assign them to a specified address.

Burning
The burn function allows any user to burn their own tokens, reducing the total token supply.

Transferring
Users can transfer tokens to another address using the transfer function. Additionally, the transferFrom function allows users to transfer tokens on behalf of another address, provided they have been approved to do so.


## Authors

Adekunle Stephen Omorotimi
[@Okste1234](https://twitter.com/okste1234)

## Loom(video) walkthrough
```bash
hhttps://www.loom.com/share/8d3008df63eb494a8bb6295b42cfbff8?sid=46db770a-6d58-491f-bd63-81e5d2012b02
```

### License

This project is licensed under the MIT License


### Disclaimer

This contract is provided as-is without any warranties or guarantees. Use it at your own risk. Make sure to review and test the contract thoroughly before deploying it to the Ethereum mainnet or any other production environment.