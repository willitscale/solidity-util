# Solidity Standard Utilities

Solidity is still very primitive and doing basic operations can be quite tedious and off-putting to newer developers. I've put together a very basic library of functions to help improve this. 

To use this library simply specify the import as the one in this library, use Strings for the data type string and use Integers for the data type uint:
```
pragma solidity ^0.4.0;
import "github.com/willitscale/solidity-util/lib/Strings.sol";
import "github.com/willitscale/solidity-util/lib/Integers.sol";
contract MyContract {
    using Strings for string;
    using Integers for uint;
}
```
This will then allow the use of the functionality listed below.

## Integers

The functionality of this library is based loosely around the Java implementation:
- [parseInt\(string\) : uint](#parseintstring--uint)
- [toString\(\) : uint](#tostring--uint)

### parseInt(string) : uint 

Convert an ASCII string to its unsigned integer equivalent

```
    function parseInt() {
        if (321 == Integers.parseInt("321")) {
            // Matches the uint value
        }
    }
```

### toString() : uint 

Convert an unsigned integer to its ASCII string equivalent

```    
    function toString(uint _value) returns (string) {
        return _value.toString();
    }
```

## Strings

**Please be aware that some of these functions can be quite gas heavy so use appropriately!**

The functionality of this library is based loosely around the Java implementation:
- [concat\(string\) : string](#concatstring--string)
- [indexOf\(string\) : int](#indexofstring--int)
- [length\(\) : uint](#length--uint)
- [substring\(uint\) : string](#substringuint--string)
- [split\(string\) : string\[\]](#splitstring--string)
- [compareTo\(string\) : bool](#comparetostring--bool)
- [compareToIgnoreCase\(string\) : bool](#comparetoignorecasestring--bool)
- [upper\(string\) : string](#upperstring--string)
- [lower\(string\) : string](#lowerstring--string)


### concat(string) : string 

Concatenate two strings together.

```
    function concat() {
        string memory myVal = "firstname";
        myVal = myVal.concat(" ").concat("lastname");
    }
```

### indexOf(string) : int

Find the position of a character.

```
    function indexOf() {
        string memory myVal = "haystack";
        uint positionOfFirstA = myVal.indexOf("a");
        uint positionOfSecondA = myVal._indexOf("a", positionOfFirstA+1);
    }
```

### length() : uint

Get the length of a string.

```
    function length() {
        string memory myVal = "length";
        if (myVal.length() == 6) {
          // Length is 6!
        }
    }
```

### substring(uint) : string

Get a partial section of the string.

```
    function substring() {
        string memory myVal = "sub string example";
        string memory firstWord = myVal.substring(3);
        string memory secondWord = myVal._substring(6,4);
    }
```

### split(string) : string[]

Splits a string into an array of smaller strings based off a delimiter.

```
    function split() {
        string memory myVal = "my example split";
        string[] storage split = myVal.split(" ");
        if (3 == split.length) {
          if(split[1].compareTo("example")) {
            // Valid split length and second word
          }
        }
    }
```

### compareTo(string) : bool

Compare two strings.

```
    function compareTo() {
        string memory myVal = "my example split";
        if(myVal.compareTo("my example split")) {
          // They match!
        }
    }
```

### compareToIgnoreCase(string) : bool

Compare two strings discarding alphabetic case.

```
    function compareToIgnoreCase() {
        string memory myVal = "my example split";
        if(myVal.compareTo("mY Example Split")) {
          // They match regardless of case!
        }
    }
```

### upper(string) : string

Converts a string to use upper alphabetic case.

```
    function upper() {
        string memory myVal = "lower";
        if(myVal.upper().compareTo("LOWER")) {
          // It's now upper!
        }
    }
```

### lower(string) : string


Converts a string to use lower alphabetic case.

```
    function lower() {
        string memory myVal = "UPPER";
        if (myVal.lower().compareTo("upper")) {
          // It's now lower!
        }
    }
```

Feel free to contribute!