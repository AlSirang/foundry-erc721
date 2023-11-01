// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";

import {DogieNFT} from "../src/DogieNFT.sol";

contract DeployDogieNFT is Script {
    function run() public returns (DogieNFT dogieNFT) {
        vm.startBroadcast();
        dogieNFT = new DogieNFT();
        vm.stopBroadcast();
    }
}
