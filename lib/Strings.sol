pragma solidity ^0.4.0;

/**
 * Strings Library
 * 
 * In summary this is a simple library of string functions which make simple 
 * string operations less tedious in solidity.
 * 
 * Please be aware these functions can be quite gas heavy so use them only when
 * necessary not to clog the blockchain with expensive transactions.
 * 
 * @author James Lockhart <james@n3tw0rk.co.uk>
 */
library Strings {

    /**
     * Concat (High gas cost)
     * 
     * Appends two strings together and returns a new value
     * 
     * @param _base When being used for a data type this is the extended object
     *              otherwise this is the string which will be the concatenated
     *              prefix
     * @param _value The value to be the concatenated suffix
     * @return string The resulting string from combinging the base and value
     */
    function concat(string _base, string _value)
        internal
        returns (string) {
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);

        assert(_valueBytes.length > 0);

        string memory _tmpValue = new string(_baseBytes.length + 
            _valueBytes.length);
        bytes memory _newValue = bytes(_tmpValue);

        uint i;
        uint j;

        for(i = 0; i < _baseBytes.length; i++) {
            _newValue[j++] = _baseBytes[i];
        }

        for(i = 0; i<_valueBytes.length; i++) {
            _newValue[j++] = _valueBytes[i];
        }

        return string(_newValue);
    }

    /**
     * Index Of
     *
     * Locates and returns the position of a character within a string
     * 
     * @param _base When being used for a data type this is the extended object
     *              otherwise this is the string acting as the haystack to be
     *              searched
     * @param _value The needle to search for, at present this is currently
     *               limited to one character
     * @return int The position of the needle starting from 0 and returning -1
     *             in the case of no matches found
     */
    function indexOf(string _base, string _value)
        internal
        returns (int) {
        return _indexOf(_base, _value, 0);
    }

    /**
     * Index Of
     *
     * Locates and returns the position of a character within a string starting
     * from a defined offset
     * 
     * @param _base When being used for a data type this is the extended object
     *              otherwise this is the string acting as the haystack to be
     *              searched
     * @param _value The needle to search for, at present this is currently
     *               limited to one character
     * @param _offset The starting point to start searching from which can start
     *                from 0, but must not exceed the length of the string
     * @return int The position of the needle starting from 0 and returning -1
     *             in the case of no matches found
     */
    function _indexOf(string _base, string _value, uint _offset)
        internal
        returns (int) {
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);

        assert(_valueBytes.length == 1);

        for(uint i = _offset; i < _baseBytes.length; i++) {
            if (_baseBytes[i] == _valueBytes[0]) {
                return int(i);
            }
        }

        return -1;
    }

    /**
     * Length
     * 
     * Returns the length of the specified string
     * 
     * @param _base When being used for a data type this is the extended object
     *              otherwise this is the string to be measured
     * @return uint The length of the passed string
     */
    function length(string _base)
        internal
        returns (uint) {
        bytes memory _baseBytes = bytes(_base);
        return _baseBytes.length;
    }

    /**
     * Sub String
     * 
     * Extracts the beginning part of a string based on the desired length
     * 
     * @param _base When being used for a data type this is the extended object
     *              otherwise this is the string that will be used for 
     *              extracting the sub string from
     * @param _length The length of the sub string to be extracted from the base
     * @return string The extracted sub string
     */
    function substring(string _base, int _length)
        internal
        returns (string) {
        return _substring(_base, _length, 0);
    }

    /**
     * Sub String
     * 
     * Extracts the part of a string based on the desired length and offset. The
     * offset and length must not exceed the lenth of the base string.
     * 
     * @param _base When being used for a data type this is the extended object
     *              otherwise this is the string that will be used for 
     *              extracting the sub string from
     * @param _length The length of the sub string to be extracted from the base
     * @param _offset The starting point to extract the sub string from
     * @return string The extracted sub string
     */
    function _substring(string _base, int _length, int _offset)
        internal
        returns (string) {
        bytes memory _baseBytes = bytes(_base);

        assert(uint(_offset+_length) <= _baseBytes.length);

        string memory _tmp = new string(uint(_length));
        bytes memory _tmpBytes = bytes(_tmp);

        uint j = 0;
        for(uint i = uint(_offset); i < uint(_offset+_length); i++) {
          _tmpBytes[j++] = _baseBytes[i];
        }

        return string(_tmpBytes);
    }

    /**
     * String Split (Very high gas cost)
     *
     * Splits a string into an array of strings based off the delimiter value.
     * Please note this can be quite a gas expensive function due to the use of
     * storage so only use if really required.
     *
     * @param _base When being used for a data type this is the extended object
     *               otherwise this is the string value to be split.
     * @param _value The delimiter to split the string on which must be a single
     *               character
     * @return string[] An array of values split based off the delimiter, but
     *                  do not container the delimiter.
     */
    function split(string _base, string _value)
        internal
        returns (string[] storage splitArr) {
        bytes memory _baseBytes = bytes(_base);
        uint _offset = 0;

        while(_offset < _baseBytes.length-1) {

            int _limit = _indexOf(_base, _value, _offset);
            if (_limit == -1) {
                _limit = int(_baseBytes.length);
            }

            string memory _tmp = new string(uint(_limit)-_offset);
            bytes memory _tmpBytes = bytes(_tmp);

            uint j = 0;
            for(uint i = _offset; i < uint(_limit); i++) {
                _tmpBytes[j++] = _baseBytes[i];
            }
            _offset = uint(_limit) + 1;
            splitArr.push(string(_tmpBytes));
        }
        return splitArr;
    }

    /**
     * Compare To
     * 
     * Compares the characters of two strings, to ensure that they have an 
     * identical footprint
     * 
     * @param _base When being used for a data type this is the extended object
     *               otherwise this is the string base to compare against
     * @param _value The string the base is being compared to
     * @return bool Simply notates if the two string have an equivalent
     */
    function compareTo(string _base, string _value) 
        internal 
        returns (bool) {
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);

        if (_baseBytes.length != _valueBytes.length) {
            return false;
        }

        for(uint i = 0; i < _baseBytes.length; i++) {
            if (_baseBytes[i] != _valueBytes[i]) {
                return false;
            }
        }

        return true;
    }

    /**
     * Compare To Ignore Case (High gas cost)
     * 
     * Compares the characters of two strings, converting them to the same case
     * where applicable to alphabetic characters to distinguish if the values
     * match.
     * 
     * @param _base When being used for a data type this is the extended object
     *               otherwise this is the string base to compare against
     * @param _value The string the base is being compared to
     * @return bool Simply notates if the two string have an equivalent value
     *              discarding case
     */
    function compareToIgnoreCase(string _base, string _value)
        internal
        returns (bool) {
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);

        if (_baseBytes.length != _valueBytes.length) {
            return false;
        }

        for(uint i = 0; i < _baseBytes.length; i++) {
            if (_baseBytes[i] != _valueBytes[i] && 
                _upper(_baseBytes[i]) != _upper(_valueBytes[i])) {
                return false;
            }
        }

        return true;
    }

    /**
     * Upper
     * 
     * Converts all the values of a string to their corresponding upper case
     * value.
     * 
     * @param _base When being used for a data type this is the extended object
     *              otherwise this is the string base to convert to upper case
     * @return string 
     */
    function upper(string _base) 
        internal 
        returns (string) {
        bytes memory _baseBytes = bytes(_base);
        for (uint i = 0; i < _baseBytes.length; i++) {
            _baseBytes[i] = _upper(_baseBytes[i]);
        }
        return string(_baseBytes);
    }

    /**
     * Lower
     * 
     * Converts all the values of a string to their corresponding lower case
     * value.
     * 
     * @param _base When being used for a data type this is the extended object
     *              otherwise this is the string base to convert to lower case
     * @return string 
     */
    function lower(string _base) 
        internal 
        returns (string) {
        bytes memory _baseBytes = bytes(_base);
        for (uint i = 0; i < _baseBytes.length; i++) {
            _baseBytes[i] = _lower(_baseBytes[i]);
        }
        return string(_baseBytes);
    }

    /**
     * Upper
     * 
     * Convert an alphabetic character to upper case and return the original
     * value when not alphabetic
     * 
     * @param _b1 The byte to be converted to upper case
     * @return bytes1 The converted value if the passed value was alphabetic
     *                and in a lower case otherwise returns the original value
     */
    function _upper(bytes1 _b1)
        private
        constant
        returns (bytes1) {

        if (_b1 == 0x61) return 0x41;
        if (_b1 == 0x62) return 0x42;
        if (_b1 == 0x63) return 0x43;
        if (_b1 == 0x64) return 0x44;
        if (_b1 == 0x65) return 0x45;
        if (_b1 == 0x66) return 0x46;
        if (_b1 == 0x67) return 0x47;
        if (_b1 == 0x68) return 0x48;
        if (_b1 == 0x69) return 0x49;
        if (_b1 == 0x6A) return 0x4A;
        if (_b1 == 0x6B) return 0x4B;
        if (_b1 == 0x6C) return 0x4C;
        if (_b1 == 0x6D) return 0x4D;
        if (_b1 == 0x6E) return 0x4E;
        if (_b1 == 0x6F) return 0x4F;
        if (_b1 == 0x70) return 0x50;
        if (_b1 == 0x71) return 0x51;
        if (_b1 == 0x72) return 0x52;
        if (_b1 == 0x73) return 0x53;
        if (_b1 == 0x74) return 0x54;
        if (_b1 == 0x75) return 0x55;
        if (_b1 == 0x76) return 0x56;
        if (_b1 == 0x77) return 0x57;
        if (_b1 == 0x78) return 0x58;
        if (_b1 == 0x79) return 0x59;
        if (_b1 == 0x7A) return 0x5A;

        return _b1;
    }

    /**
     * Lower
     * 
     * Convert an alphabetic character to lower case and return the original
     * value when not alphabetic
     * 
     * @param _b1 The byte to be converted to lower case
     * @return bytes1 The converted value if the passed value was alphabetic
     *                and in a upper case otherwise returns the original value
     */
    function _lower(bytes1 _b1)
        private
        constant
        returns (bytes1) {

        if (_b1 == 0x41) return 0x61;
        if (_b1 == 0x42) return 0x62;
        if (_b1 == 0x43) return 0x63;
        if (_b1 == 0x44) return 0x64;
        if (_b1 == 0x45) return 0x65;
        if (_b1 == 0x46) return 0x66;
        if (_b1 == 0x47) return 0x67;
        if (_b1 == 0x48) return 0x68;
        if (_b1 == 0x49) return 0x69;
        if (_b1 == 0x4A) return 0x6A;
        if (_b1 == 0x4B) return 0x6B;
        if (_b1 == 0x4C) return 0x6C;
        if (_b1 == 0x4D) return 0x6D;
        if (_b1 == 0x4E) return 0x6E;
        if (_b1 == 0x4F) return 0x6F;
        if (_b1 == 0x50) return 0x70;
        if (_b1 == 0x51) return 0x71;
        if (_b1 == 0x52) return 0x72;
        if (_b1 == 0x53) return 0x73;
        if (_b1 == 0x54) return 0x74;
        if (_b1 == 0x55) return 0x75;
        if (_b1 == 0x56) return 0x76;
        if (_b1 == 0x57) return 0x77;
        if (_b1 == 0x58) return 0x78;
        if (_b1 == 0x59) return 0x79;
        if (_b1 == 0x5A) return 0x7A;

        return _b1;
    }
}

