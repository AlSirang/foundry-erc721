// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {MoodNFT} from "../../src/MoodNFT.sol";

contract TestMoodNFT is Test {
    MoodNFT private moodNFT;
    address USER = makeAddr("user");

    string constant HAPPY_MOOD_URI =
        "data:application/json;base64,eyJuYW1lIjoiTW9vZCBORlQiLCAiZGVzY3JpcHRpb24iOiJBbiBORlQgdGhhdCByZWZsZWN0cyB0aGUgbW9vZCBvZiB0aGUgb3duZXIsIDEwMCUgb24gQ2hhaW4hIiwgImF0dHJpYnV0ZXMiOiBbeyJ0cmFpdF90eXBlIjogIm1vb2RpbmVzcyIsICJ2YWx1ZSI6IDEwMH1dLCAiaW1hZ2UiOiJkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LFBITjJaeUIzYVdSMGFEMGlNakF3Y0hnaUlHaGxhV2RvZEQwaU1qQXdjSGdpSUhodGJHNXpQU0pvZEhSd09pOHZkM2QzTG5jekxtOXlaeTh5TURBd0wzTjJaeUkrQ2lBZ1BHTnBjbU5zWlNCamVEMGlNVEF3SWlCamVUMGlNVEF3SWlCeVBTSTRNQ0lnWm1sc2JEMGllV1ZzYkc5M0lpQXZQZ29nSUR4amFYSmpiR1VnWTNnOUlqY3dJaUJqZVQwaU56QWlJSEk5SWpFd0lpQm1hV3hzUFNKaWJHRmpheUlnTHo0S0lDQThZMmx5WTJ4bElHTjRQU0l4TXpBaUlHTjVQU0kzTUNJZ2NqMGlNVEFpSUdacGJHdzlJbUpzWVdOcklpQXZQZ29nSUR4d1lYUm9JR1E5SWswMk1Dd3hNakFnVVRFd01Dd3hOVEFnTVRRd0xERXlNQ0lnWm1sc2JEMGlkSEpoYm5Od1lYSmxiblFpSUhOMGNtOXJaVDBpWW14aFkyc2lJSE4wY205clpTMTNhV1IwYUQwaU5TSWdMejRLUEM5emRtYysifQ==";

    string private constant HAPPY_SVG_IMAGE_URI =
        "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwcHgiIGhlaWdodD0iMjAwcHgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgPGNpcmNsZSBjeD0iMTAwIiBjeT0iMTAwIiByPSI4MCIgZmlsbD0ieWVsbG93IiAvPgogIDxjaXJjbGUgY3g9IjcwIiBjeT0iNzAiIHI9IjEwIiBmaWxsPSJibGFjayIgLz4KICA8Y2lyY2xlIGN4PSIxMzAiIGN5PSI3MCIgcj0iMTAiIGZpbGw9ImJsYWNrIiAvPgogIDxwYXRoIGQ9Ik02MCwxMjAgUTEwMCwxNTAgMTQwLDEyMCIgZmlsbD0idHJhbnNwYXJlbnQiIHN0cm9rZT0iYmxhY2siIHN0cm9rZS13aWR0aD0iNSIgLz4KPC9zdmc+";
    string private constant SAD_SVG_IMAGE_URI =
        "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwcHgiIGhlaWdodD0iMjAwcHgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgPGNpcmNsZSBjeD0iMTAwIiBjeT0iMTAwIiByPSI4MCIgZmlsbD0ieWVsbG93IiAvPgogIDxjaXJjbGUgY3g9IjcwIiBjeT0iNzAiIHI9IjEwIiBmaWxsPSJibGFjayIgLz4KICA8Y2lyY2xlIGN4PSIxMzAiIGN5PSI3MCIgcj0iMTAiIGZpbGw9ImJsYWNrIiAvPgogIDxwYXRoIGQ9Ik02MCwxMzAgUTEwMCwxMDAgMTQwLDEzMCIgZmlsbD0idHJhbnNwYXJlbnQiIHN0cm9rZT0iYmxhY2siIHN0cm9rZS13aWR0aD0iNSIgLz4KPC9zdmc+Cg==";

    function setUp() external {
        moodNFT = new MoodNFT(HAPPY_SVG_IMAGE_URI, SAD_SVG_IMAGE_URI);
    }

    function testViewTokenURI() public {
        vm.prank(USER);
        moodNFT.mint();
        assert(
            keccak256(abi.encodePacked(moodNFT.tokenURI(0))) ==
                keccak256(abi.encodePacked(HAPPY_MOOD_URI))
        );
    }
}
