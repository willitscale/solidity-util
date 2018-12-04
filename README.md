# Solidity Standard Utilities

Solidity is still very primitive and doing basic operations can be quite tedious and off-putting to newer developers. I've put together a very basic library of functions to help improve this. 

The easiest way to use this library is to install it with npm as
```bash
npm install willitscale/solidity-util
```

In a project based on [Truffle framework](https://truffleframework.com/) you may then import and bind the libraries to the appropriate data types as seen below:
```javascript
pragma solidity ^0.4.0;

import "solidity-util/lib/Strings.sol";
import "solidity-util/lib/Integers.sol";
import "solidity-util/lib/Addresses.sol";

contract MyContract {
    using Strings for string;
    using Integers for uint;
    using Addresses for address;
}
```
This will then allow the use of the functionality listed below.

Other frameworks may require slightly different approaches than the description above.

## Addresses

The functionality of this library is to extend the existing functionality of an address:
- [isContract\(address\) : bool](#iscontractaddress--bool)

### isContract(address) : bool 

Check to see if the subject address is a contract on the Ethereum network

```javascript
    function isContract(address _addr) public {
        if (_addr.isContract()) {
            // Do contract specific stuff
        }
    }
```

## Integers

The functionality of this library is based loosely around the Java implementation:
- [parseInt\(string\) : uint](#parseintstring--uint)
- [toString\(\) : uint](#tostring--uint)
- [toBytes\(uint\) : bytes](#tobytesuint--bytes)
- [toByte\(uint8\) : byte](#tobyteuint8--byte)

### parseInt(string) : uint 

Convert an ASCII string to its unsigned integer equivalent

```javascript
    function parseInt() {
        if (321 == Integers.parseInt("321")) {
            // Matches the uint value
        }
    }
```

### toString() : uint 

Convert an unsigned integer to its ASCII string equivalent

```javascript
    function toString(uint _value) returns (string) {
        return _value.toString();
    }
```

### toBytes(uint) : bytes 

Convert an unsigned integer to a bytes equivalent

```javascript
    function toString(uint _value) returns (bytes) {
        return _value.toBytes();
    }
```

### toByte(uint8) : byte 

Convert an 8-bit unsigned integer to its byte equivalent

```javascript
    function toByte(uint8 _value) {
        if (0x1 == Integer.toByte(_value)) {
            // Matching byte
        }
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

```javascript
    function concat() {
        string memory myVal = "firstname";
        myVal = myVal.concat(" ").concat("lastname");
    }
```

### indexOf(string) : int

Find the position of a character.

```javascript
    function indexOf() {
        string memory myVal = "haystack";
        uint positionOfFirstA = myVal.indexOf("a");
        uint positionOfSecondA = myVal._indexOf("a", positionOfFirstA+1);
    }
```

### length() : uint

Get the length of a string.

```javascript
    function length() {
        string memory myVal = "length";
        if (myVal.length() == 6) {
          // Length is 6!
        }
    }
```

### substring(uint) : string

Get a partial section of the string.

```javascript
    function substring() {
        string memory myVal = "sub string example";
        string memory firstWord = myVal.substring(3);
        string memory secondWord = myVal._substring(6,4);
    }
```

### split(string) : string[]

Splits a string into an array of smaller strings based off a delimiter.

```javascript
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

```javascript
    function compareTo() {
        string memory myVal = "my example split";
        if(myVal.compareTo("my example split")) {
          // They match!
        }
    }
```

### compareToIgnoreCase(string) : bool

Compare two strings discarding alphabetic case.

```javascript
    function compareToIgnoreCase() {
        string memory myVal = "my example split";
        if(myVal.compareTo("mY Example Split")) {
          // They match regardless of case!
        }
    }
```

### upper(string) : string

Converts a string to use upper alphabetic case.

```javascript
    function upper() {
        string memory myVal = "lower";
        if(myVal.upper().compareTo("LOWER")) {
          // It's now upper!
        }
    }
```

### lower(string) : string


Converts a string to use lower alphabetic case.

```javascript
    function lower() {
        string memory myVal = "UPPER";
        if (myVal.lower().compareTo("upper")) {
          // It's now lower!
        }
    }
```

Feel free to contribute!
