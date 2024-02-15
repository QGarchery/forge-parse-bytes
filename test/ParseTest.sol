// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../lib/forge-std/src/Test.sol";
import "../lib/forge-std/src/StdJson.sol";

contract ParseTest is Test {
    using stdJson for string;

    struct S {
        bytes32 id;
        address addr;
    }

    function testParse() public view {
        string memory projectRoot = vm.projectRoot();
        string memory path = string.concat(projectRoot, "/example.json");
        string memory json = vm.readFile(path);

        abi.decode(json.parseRaw(""), (S));
    }
}
