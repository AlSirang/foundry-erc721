// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNFT} from "../../script/DeployMoodNFT.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNFT deployer;

    function setUp() public {
        deployer = new DeployMoodNFT();
    }

    function testConvertSvgToURI() public view {
        string
            memory expectedURI = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwcHgiIGhlaWdodD0iMjAwcHgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGNpcmNsZSBjeD0iMTAwIiBjeT0iMTAwIiByPSI4MCIgZmlsbD0ieWVsbG93IiAvPjxjaXJjbGUgY3g9IjcwIiBjeT0iNzAiIHI9IjEwIiBmaWxsPSJibGFjayIgLz48Y2lyY2xlIGN4PSIxMzAiIGN5PSI3MCIgcj0iMTAiIGZpbGw9ImJsYWNrIiAvPjxwYXRoIGQ9Ik02MCwxMjAgUTEwMCwxNTAgMTQwLDEyMCIgZmlsbD0idHJhbnNwYXJlbnQiIHN0cm9rZT0iYmxhY2siIHN0cm9rZS13aWR0aD0iNSIgLz48L3N2Zz4=";
        string
            memory svg = '<svg width="200px" height="200px" xmlns="http://www.w3.org/2000/svg"><circle cx="100" cy="100" r="80" fill="yellow" /><circle cx="70" cy="70" r="10" fill="black" /><circle cx="130" cy="70" r="10" fill="black" /><path d="M60,120 Q100,150 140,120" fill="transparent" stroke="black" stroke-width="5" /></svg>';

        string memory actualURI = deployer.svgToImageURI(svg);

        assert(
            keccak256(bytes(abi.encodePacked(expectedURI))) ==
                keccak256(bytes(abi.encodePacked(actualURI)))
        );
    }
}
