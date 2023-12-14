// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNFT is ERC721 {
    enum Mood {
        HAPPY,
        SAD
    }
    uint256 private s_tokenCounter;

    string private s_happySvgImgURI;
    string private s_sadSvgImgURI;

    mapping(uint256 => Mood) private s_tokenIdToMood;

    constructor(
        string memory happySvgImgURI,
        string memory sadSvgImgURI
    ) ERC721("Mood NFT", "MN") {
        s_happySvgImgURI = happySvgImgURI;
        s_sadSvgImgURI = sadSvgImgURI;
    }

    function mint() external {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToMood[s_tokenCounter] = Mood.HAPPY;
        s_tokenCounter++;
    }

    function flipMood(uint256 tokenId) external {
        address from = _ownerOf(tokenId);
        _checkAuthorized(from, msg.sender, tokenId);

        if (s_tokenIdToMood[tokenId] == Mood.HAPPY) {
            s_tokenIdToMood[tokenId] = Mood.SAD;
        } else {
            s_tokenIdToMood[tokenId] = Mood.HAPPY;
        }
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        _requireOwned(tokenId);

        string memory imageURI;

        if (s_tokenIdToMood[tokenId] == Mood.HAPPY) imageURI = s_happySvgImgURI;
        else imageURI = s_sadSvgImgURI;
        return
            string(
                abi.encodePacked(
                    _baseURI(),
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name":"',
                                name(),
                                '", "description":"An NFT that reflects the mood of the owner, 100% on Chain!", ',
                                '"attributes": [{"trait_type": "moodiness", "value": 100}], "image":"',
                                imageURI,
                                '"}'
                            )
                        )
                    )
                )
            );
    }
}
