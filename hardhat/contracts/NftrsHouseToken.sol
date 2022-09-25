// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NftrsHouseToken is ERC721 {
    address public owner;
    uint256 tokenId = 1;

    struct House {
        uint256 tokenId;
        string tokenName;
        address owner;
        uint price;
    }

    House[] allTokens;

    mapping(address => House[]) public tokenAddress;
    mapping(string => bool) tokenExists;

    constructor() ERC721("NftrsHouseToken", "NFTRSHOUSE") {
        owner = msg.sender;
    }

    function getAllTokens() public view returns (House[] memory) {
        return allTokens;
    }

    function getMyTokens() public view returns (House[] memory) {
        return tokenAddress[msg.sender];
    }

    function mintToken(string calldata _tokenName) public payable {
        require(!tokenExists[_tokenName], "Token already taken");
        House memory houseToMint = House(tokenId, _tokenName, msg.sender, 100);
        _safeMint(msg.sender, tokenId);
        allTokens.push(houseToMint);
        tokenAddress[msg.sender].push(houseToMint);
        tokenExists[_tokenName] = true;
        tokenId++;
    }
}
