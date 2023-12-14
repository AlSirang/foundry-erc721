// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNFT} from "../../script/DeployMoodNFT.s.sol";
import {MoodNFT} from "../../src/MoodNFT.sol";

contract TestMoodNftIntegration is Test {
    MoodNFT private moodNFT;
    address USER = makeAddr("user");

    string constant HAPPY_MOOD_URI =
        "data:application/json;base64,eyJuYW1lIjoiTW9vZCBORlQiLCAiZGVzY3JpcHRpb24iOiJBbiBORlQgdGhhdCByZWZsZWN0cyB0aGUgbW9vZCBvZiB0aGUgb3duZXIsIDEwMCUgb24gQ2hhaW4hIiwgImF0dHJpYnV0ZXMiOiBbeyJ0cmFpdF90eXBlIjogIm1vb2RpbmVzcyIsICJ2YWx1ZSI6IDEwMH1dLCAiaW1hZ2UiOiJkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LFBITjJaeUIzYVdSMGFEMGlNakF3Y0hnaUlHaGxhV2RvZEQwaU1qQXdjSGdpSUhodGJHNXpQU0pvZEhSd09pOHZkM2QzTG5jekxtOXlaeTh5TURBd0wzTjJaeUkrQ2lBZ1BHTnBjbU5zWlNCamVEMGlNVEF3SWlCamVUMGlNVEF3SWlCeVBTSTRNQ0lnWm1sc2JEMGllV1ZzYkc5M0lpQXZQZ29nSUR4amFYSmpiR1VnWTNnOUlqY3dJaUJqZVQwaU56QWlJSEk5SWpFd0lpQm1hV3hzUFNKaWJHRmpheUlnTHo0S0lDQThZMmx5WTJ4bElHTjRQU0l4TXpBaUlHTjVQU0kzTUNJZ2NqMGlNVEFpSUdacGJHdzlJbUpzWVdOcklpQXZQZ29nSUR4d1lYUm9JR1E5SWswMk1Dd3hNakFnVVRFd01Dd3hOVEFnTVRRd0xERXlNQ0lnWm1sc2JEMGlkSEpoYm5Od1lYSmxiblFpSUhOMGNtOXJaVDBpWW14aFkyc2lJSE4wY205clpTMTNhV1IwYUQwaU5TSWdMejRLUEM5emRtYysifQ==";

    string constant SAD_MOOD_URI =
        "data:application/json;base64,eyJuYW1lIjoiTW9vZCBORlQiLCAiZGVzY3JpcHRpb24iOiJBbiBORlQgdGhhdCByZWZsZWN0cyB0aGUgbW9vZCBvZiB0aGUgb3duZXIsIDEwMCUgb24gQ2hhaW4hIiwgImF0dHJpYnV0ZXMiOiBbeyJ0cmFpdF90eXBlIjogIm1vb2RpbmVzcyIsICJ2YWx1ZSI6IDEwMH1dLCAiaW1hZ2UiOiJkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LFBITjJaeUIzYVdSMGFEMGlNakF3Y0hnaUlHaGxhV2RvZEQwaU1qQXdjSGdpSUhodGJHNXpQU0pvZEhSd09pOHZkM2QzTG5jekxtOXlaeTh5TURBd0wzTjJaeUkrQ2lBZ1BHTnBjbU5zWlNCamVEMGlNVEF3SWlCamVUMGlNVEF3SWlCeVBTSTRNQ0lnWm1sc2JEMGllV1ZzYkc5M0lpQXZQZ29nSUR4amFYSmpiR1VnWTNnOUlqY3dJaUJqZVQwaU56QWlJSEk5SWpFd0lpQm1hV3hzUFNKaWJHRmpheUlnTHo0S0lDQThZMmx5WTJ4bElHTjRQU0l4TXpBaUlHTjVQU0kzTUNJZ2NqMGlNVEFpSUdacGJHdzlJbUpzWVdOcklpQXZQZ29nSUR4d1lYUm9JR1E5SWswMk1Dd3hNekFnVVRFd01Dd3hNREFnTVRRd0xERXpNQ0lnWm1sc2JEMGlkSEpoYm5Od1lYSmxiblFpSUhOMGNtOXJaVDBpWW14aFkyc2lJSE4wY205clpTMTNhV1IwYUQwaU5TSWdMejRLUEM5emRtYytDZz09In0=";

    function setUp() external {
        DeployMoodNFT deployer = new DeployMoodNFT();
        moodNFT = deployer.run();
    }

    modifier mintNFT() {
        vm.prank(USER);
        moodNFT.mint();

        _;
    }

    function testViewTokenUriIntegration() external mintNFT {
        console.log(moodNFT.tokenURI(0));
        assert(
            keccak256(abi.encodePacked(moodNFT.tokenURI(0))) ==
                keccak256(abi.encodePacked(HAPPY_MOOD_URI))
        );
    }

    function testFlipTokenToSad() public mintNFT {
        vm.prank(USER);
        moodNFT.flipMood(0);

        assert(
            keccak256(abi.encodePacked(moodNFT.tokenURI(0))) ==
                keccak256(abi.encodePacked(SAD_MOOD_URI))
        );
    }
}
