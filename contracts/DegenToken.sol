// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    enum GameItems {
        Elixir,
        Thunderbolt,
        Phoenix,
        Amulet,
        Goblinbane,
        Cloak
    }

    struct User {
        address account;
        GameItems item;
    }

    mapping(address => User) user;
    mapping(GameItems => uint256) public itemPrice;

    User[] public player;

    event TokensMinted(address indexed to, uint256 amount);
    event TokensBurned(address indexed from, uint256 amount);
    event ItemRedeemed(address indexed user, GameItems item);

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        itemPrice[GameItems.Elixir] = 10 * 10e18;
        itemPrice[GameItems.Thunderbolt] = 8 * 10e18;
        itemPrice[GameItems.Phoenix] = 6 * 10e18;
        itemPrice[GameItems.Amulet] = 4 * 10e18;
        itemPrice[GameItems.Goblinbane] = 2 * 10e18;
        itemPrice[GameItems.Cloak] = 1 * 10e18;
    }

    function mint(address _to, uint256 _amount) external onlyOwner {
        _mint(_to, _amount);

        emit TokensMinted(_to, _amount);
    }

    function redeemItem(GameItems item) external {
        require(
            balanceOf(msg.sender) >= itemPrice[item],
            "Insufficient DGN balance"
        );

        uint256 bal = getBalance();

        bal -= itemPrice[item];

        _transfer(msg.sender, address(this), itemPrice[item]);

        User storage gamer = user[msg.sender];
        gamer.item = item;
        gamer.account = msg.sender;

        player.push(gamer);

        emit ItemRedeemed(msg.sender, item);
    }

    function transferDGNToken(
        address _to,
        uint256 _amount
    ) external returns (bool success) {
        require(balanceOf(msg.sender) >= _amount, "Insufficient DGN Token");

        return transfer(_to, _amount);
    }

    function burn(uint256 _amount) external {
        require(balanceOf(msg.sender) >= _amount, "Insufficient DGN Token");
        _burn(msg.sender, _amount);

        emit TokensBurned(msg.sender, _amount);
    }

    function getBalance() public view returns (uint256) {
        return balanceOf(msg.sender);
    }
}
