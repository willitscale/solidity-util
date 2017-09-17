pragma solidity ^0.4.0;

import "lib/Strings.sol";

/**
 * This is a manual set of tests, but I would suggest using Truffle if you
 * develop outside of remix
 *
 * WARNING: This is extremely gas heavy and should not be published to the
 * blockchain!
 */
contract StringsTest {
    using Strings for string;

    /**
     * Run this test first to ensure that the compareTo is correct as some
     * other tests depend on it
     */
    function compareToTest() {
        string memory myVal = "my testing split";
        assert(!myVal.compareTo("invalid"));
        assert(myVal.compareTo("my testing split"));
        assert(!myVal.compareTo("mY Testing split"));
        assert(!myVal.compareTo(""));
    }

    function testConcat() {
        string memory myVal = "prefix_";
        assert(myVal.concat("suffix").compareTo("prefix_suffix"));
        assert(myVal.concat("suffix").concat("_another")
            .compareTo("prefix_suffix_another"));
        assert(!myVal.concat("fail").compareTo("prefix_"));
    }


    function testIndexOf() {
        string memory myVal = "haystack";
        assert(myVal.indexOf("a") == 1);
        assert(myVal.indexOf("A") == -1);
        assert(myVal.indexOf("z") == -1);
    }

    function test_IndexOf() {
        string memory myVal = "haystack";
        assert(myVal._indexOf("a", 2) == 5);
        assert(myVal._indexOf("A", 2) == -1);
        assert(myVal._indexOf("h", 2) == -1);
    }

    function testLength() {
        string memory myVal = "length";
        assert(myVal.length() == 6);
    }

    function testSubstring() {
        string memory myVal = "sub string testing";
        assert(myVal.substring(3).compareTo("sub"));
        assert(myVal.substring(10).compareTo("sub string"));
    }

    function test_Substring() {
        string memory myVal = "sub string testing";
        assert(myVal._substring(6,4).compareTo("string"));
        assert(myVal._substring(7,11).compareTo("testing"));
    }

    function testUpper() {
        string memory myVal = "lower";
        assert(myVal.upper().compareTo("LOWER"));
    }

    function testLower() {
        string memory myVal = "UPPER";
        assert(myVal.lower().compareTo("upper"));
    }

    function testSplitWithDelimiter() {
        string memory myVal = "my testing split";
        string[] storage split = myVal.split(" ");
        assert(3 == split.length);
        assert(split[0].compareTo("my"));
        assert(split[1].compareTo("testing"));
        assert(split[2].compareTo("split"));
    }

    function compareToIgnoreCaseTest() {
        string memory myVal = "my testing split";
        assert(!myVal.compareToIgnoreCase("invalid"));
        assert(myVal.compareToIgnoreCase("my testing split"));
        assert(myVal.compareToIgnoreCase("mY Testing split"));
    }
}

