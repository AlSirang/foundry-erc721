// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";

import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {MoodNFT} from "../src/MoodNFT.sol";

contract DeployMoodNFT is Script {
    function run() public returns (MoodNFT moodNFT) {
        string memory sadSvg = vm.readFile("./images/sad.svg");
        string memory happySvg = vm.readFile("./images/happy.svg");

        vm.startBroadcast();
        moodNFT = new MoodNFT(svgToImageURI(happySvg), svgToImageURI(sadSvg));
        vm.stopBroadcast();
    }

    function svgToImageURI(
        string memory svg
    ) public pure returns (string memory) {
        string memory baseURI = "data:image/svg+xml;base64,";

        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );

        return string(abi.encodePacked(baseURI, svgBase64Encoded));
    }
}
