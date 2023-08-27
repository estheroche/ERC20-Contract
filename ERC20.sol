// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract CHIX {
    // A token that can be transfered from one person to the other
    // it should have a name
    // it should maximum supply
    // it should have initial supply
    // total supply
    // symbol
    // owner
    // balanceOf
    //allowance
    //minting
    //burnable
    //event

    string public name;
    uint public totalSupply;
    string public symbol;
    uint constant DECIMAL = 18;

    constructor(string memory _name, uint, string memory _sym) {
        name = _name;

        symbol = _sym;
        totalSupply = totalSupply;
    }

    event Transfer(address indexed from, address to, uint value);
    event TransferFrom(address indexed from, address to, uint value);
    event Approve(address indexed from, address to, uint value);

    mapping(address => uint) public balance;
    mapping(address => mapping(address => uint)) public _allowance;

    function nameToken() public view returns (string memory) {
        return name;
    }

    function symbolToken() public view returns (string memory _sym) {
        return symbol;
    }

    function decimalsToken() public pure returns (uint) {
        return DECIMAL;
    }

    function totalSupplyToken() public view returns (uint256) {
        return totalSupply;
    }

    function balanceOf(address _owner) public view returns (uint _balance) {
        return balance[_owner];
    }

    function transfer(
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(_to != address(0));
        require(_value > 0, "not enough");
        require(balance[msg.sender] >= _value, "not enough bal");
        balance[msg.sender] -= _value;
        balance[_to] += _value;
        success = true;

        emit Transfer(msg.sender, _to, _value);
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(_to != address(0), "adr ZERO not allowed");
        require(_value > 0, "not enogh");
        require(balanceOf(_from) >= _value, "not enough");
        balance[_from] -= _value;
        balance[_to] += _value;
        success = true;

        emit TransferFrom(_from, _to, _value);
    }

    function approve(
        address _spender,
        uint256 _value
    ) public returns (bool success) {
        require(_spender != address(0), "ZERO address not allowed");
        _allowance[msg.sender][_spender] = _value;
        success = true;
        emit Approve(msg.sender, _spender, _value);
    }

    function allowance(
        address _owner,
        address _spender
    ) public view returns (uint256 remaining) {
        _allowance[_owner][_spender];
        remaining;
    }

    function mint(address _to, uint _value) external {
        require(_to != address(0), "not Zero");
        balance[_to] += _value;
        totalSupply -= _value;
    }

    function burn(uint _value) external view {
        require(balance[msg.sender] >= _value, " insufficient");
    }
}
