// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    // ---------------------------------------
    // Token metadata
    // ---------------------------------------
    string public name = "MyToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;

    // Total supply of tokens
    uint256 public totalSupply;

    // ---------------------------------------
    // Mappings
    // ---------------------------------------
    // Track balances of all addresses
    mapping(address => uint256) public balanceOf;

    // Track allowances: owner => (spender => amount)
    mapping(address => mapping(address => uint256)) public allowance;

    // ---------------------------------------
    // ERC-20 Events
    // ---------------------------------------
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // ---------------------------------------
    // Constructor: Mint initial supply to deployer
    // ---------------------------------------
    constructor(uint256 _totalSupply) {
        totalSupply = _totalSupply * (10 ** uint256(decimals));
        balanceOf[msg.sender] = totalSupply;

        // Emit minting event
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    // ---------------------------------------
    // Step 4: Transfer tokens to another address
    // ---------------------------------------
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Cannot transfer to zero address");
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");

        // Update balances
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        // Emit Transfer event
        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    // ---------------------------------------
    // Step 5: Approve spender to use tokens
    // ---------------------------------------
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_spender != address(0), "Cannot approve zero address");

        // Set allowance
        allowance[msg.sender][_spender] = _value;

        // Emit Approval event
        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    // ---------------------------------------
    // Step 6: Transfer tokens on behalf of the owner
    // ---------------------------------------
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Cannot transfer to zero address");
        require(balanceOf[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");

        // Update balances
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        // Reduce allowance
        allowance[_from][msg.sender] -= _value;

        // Emit Transfer event
        emit Transfer(_from, _to, _value);

        return true;
    }

    // ---------------------------------------
    // Step 7: Optional Helper Functions
    // ---------------------------------------

    // Get total supply explicitly
    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    // Get token details in a single call
    function getTokenInfo()
        public
        view
        returns (string memory, string memory, uint8, uint256)
    {
        return (name, symbol, decimals, totalSupply);
    }
}
