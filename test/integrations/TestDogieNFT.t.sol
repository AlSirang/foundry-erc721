// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployDogieNFT} from "../../script/DeployDogieNFT.s.sol";
import {DogieNFT} from "../../src/DogieNFT.sol";

contract TestDogieNFT is Test {
    DogieNFT private dogieNFT;
    string private constant NAME = "Dogie NFT";
    string private constant SYMBOL = "DOG";
    string private constant DEFAULT_TOKEN_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    address USER = makeAddr("user");

    function setUp() external {
        DeployDogieNFT deployer = new DeployDogieNFT();
        dogieNFT = deployer.run();
    }

    function testCollectionName() external view {
        bytes32 expectedName = keccak256(abi.encodePacked(NAME));
        bytes32 actualName = keccak256(abi.encodePacked(dogieNFT.name()));
        assert(expectedName == actualName);
    }

    function testCollectionSymbol() external view {
        bytes32 expectedSymbol = keccak256(abi.encodePacked(SYMBOL));
        bytes32 actualSymbol = keccak256(abi.encodePacked(dogieNFT.symbol()));
        assert(expectedSymbol == actualSymbol);
    }

    modifier mintNFT() {
        vm.prank(USER);
        dogieNFT.mintNFT("");

        _;
    }

    function testUserCanMintAndHaveBalance() external mintNFT {
        assert(dogieNFT.balanceOf(USER) == 1);
    }

    function testUserCanMintAndUpdateURI() external mintNFT {
        assert(
            keccak256(abi.encodePacked(dogieNFT.tokenURI(0))) ==
                keccak256(abi.encodePacked(DEFAULT_TOKEN_URI))
        );
    }
}
