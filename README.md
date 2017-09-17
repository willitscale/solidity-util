# Solidity Standard Utilities

Solidity is still very primitive and doing basic operations can be quite tedious and off-putting to newer developers. I've put together a very basic library of functions to help improve this. 

**Please be aware that some of these functions can be quite gas heavy so use appropriately!**

Currently, there is only a utility for functions which is loosely based around the Java implementation of strings which has the following support:
- concat(string) : string
- indexOf(string) : int
- length() : uint
- substring(uint) : string
- split(string) : string[]
- compareTo(string) : bool
- compareToIgnoreCase(string) : bool
- upper(string) : string
- lower(string) : string

To use this library simply specify the import as the one in this library and use Strings for the data type string:
```
pragma solidity ^0.4.0;
import "github.com/willitscale/solidity-util/lib/Strings.sol";
contract MyContract {
    using Strings for string;
}
```

This will then allow the use of the functionality listed above.

## Concat

Concatenate two strings together.

```
    function concat() {
        string memory myVal = "firstname";
        myVal.concat(" ").concat("lastname");
    }
```

## IndexOf

Find the position of a character

```
    function indexOf() {
        string memory myVal = "haystack";
        uint positionOfFirstA = myVal.indexOf("a");
        uint positionOfSecondA = myVal._indexOf("a", positionOfFirstA+1);
    }
```

## Length

Get the length of a string

```
    function length() {
        string memory myVal = "length";
        if (myVal.length() == 6) {
          // Length is 6!
        }
    }
```

## Substring

Get a partial section of the string

```
    function substring() {
        string memory myVal = "sub string example";
        string memory firstWord = myVal.substring(3);
        string memory secondWord = myVal._substring(6,4);
    }
```

## Split

Splits a string into an array of smaller strings based off a delimiter

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

## CompareTo

Compare two strings

```
    function compareTo() {
        string memory myVal = "my example split";
        if(myVal.compareTo("my example split")) {
          // They match!
        }
    }
```


## CompareToIgnoreCase

Compare two strings

```
    function compareToIgnoreCase() {
        string memory myVal = "my example split";
        if(myVal.compareTo("mY Example Split")) {
          // They match regardless of case!
        }
    }
```

## Upper

Converts a string to use upper alphabetic case

```
    function upper() {
        string memory myVal = "lower";
        if(myVal.upper().compareTo("LOWER")) {
          // It's now upper!
        }
    }
```

## Lower


Converts a string to use lower alphabetic case

```
    function lower() {
        string memory myVal = "UPPER";
        if (myVal.lower().compareTo("upper")) {
          // It's now lower!
        }
    }
```

Feel free to contribute!
