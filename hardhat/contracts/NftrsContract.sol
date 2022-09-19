// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.9;

import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NftrsContract is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("HousingNFTRS", "HOUSE") {
        console.log("This is my Housing NftrsContract. Woah!");
    }

    function mintHouseProperty() public {
        uint256 newItemId = _tokenIds.current();
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, "metadata.json");
        _tokenIds.increment();
        console.log("A new NFTRS with id %s was minted to %s", newItemId, msg.sender);
    }
}
