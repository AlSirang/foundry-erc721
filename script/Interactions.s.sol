//  string public constant PUG_URI =
//         "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {DogieNFT} from "../src/DogieNFT.sol";
import {MoodNFT} from "../src/MoodNFT.sol";

contract MintDogieNFT is Script {
    function run() external {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "DogieNFT",
            block.chainid
        );

        mintNftOnContract(mostRecentDeployed);
    }

    function mintNftOnContract(address _collection) public {
        vm.startBroadcast();
        DogieNFT(_collection).mintNFT("");
        vm.stopBroadcast();
    }
}

contract MintMoodNFT is Script {
    function run() external {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "DogieNFT",
            block.chainid
        );

        mintMoodNnftOnContract(mostRecentDeployed);
    }

    function mintMoodNnftOnContract(address _collection) public {
        vm.startBroadcast();
        MoodNFT(_collection).mint();
        vm.stopBroadcast();
    }
}
