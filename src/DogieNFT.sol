// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract DogieNFT is ERC721 {
    string private constant DEFAULT_TOKEN_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    uint256 private s_tokenCounter;

    mapping(uint256 => string) private s_tokenURI;

    constructor() ERC721("Dogie NFT", "DOG") {
        s_tokenCounter = 0;
    }

    function mintNFT(string memory _tokenUri) public {
        if (bytes(_tokenUri).length == 0) _tokenUri = DEFAULT_TOKEN_URI;
        s_tokenURI[s_tokenCounter] = _tokenUri;

        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        _requireOwned(tokenId);
        return s_tokenURI[tokenId];
    }
}
