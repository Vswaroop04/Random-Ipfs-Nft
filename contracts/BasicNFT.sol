//SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

pragma solidity ^0.8.0;

contract BasicNFT is ERC721 {
    string public constant TOKEN_URI =
        "ipfs://QmTd7Evf9G6bsasALaSSyAtrABtmMEwzCt3ofWGyDxmqaq/";
    uint256 public s_tokenCounter = 0;

    constructor() ERC721("IIITV NFT", "IIITV") {}

    function mint_nft(address receiver) public returns (uint256) {
        _safeMint(receiver, s_tokenCounter);
        s_tokenCounter++;
        return s_tokenCounter;
    }

    function tokenURI(
        uint256 /* tokenId */
    ) public view virtual override returns (string memory) {
        return TOKEN_URI;
    }
 
    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
}
