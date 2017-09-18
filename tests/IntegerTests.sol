pragma solidity ^0.4.0;

import "lib/Strings.sol";
import "lib/Integers.sol";

/**
 * This is a manual set of tests, but I would suggest using Truffle if you
 * develop outside of remix
 *
 * WARNING: This is extremely gas heavy and should not be published to the
 * blockchain!
 */
contract TestIntegers {
    using Integers for uint;
    using Strings for string;
    
    function toStringTest() {
        uint example = 1223;
        string memory comparison = "1223";
        assert(comparison.compareTo(example.toString()));
    }
    
    function parseIntTest() {
        assert(321 == Integers.parseInt("321"));
    }
}