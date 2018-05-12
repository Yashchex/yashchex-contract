pragma solidity ^0.4.18;

import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";
import "zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";

contract ExampleToken is StandardToken, DetailedERC20 {

    modifier notFrozen(address owner) {
        require(m_freeze_info[msg.sender] <= now);
        _;
    }

    constructor() public
        DetailedERC20("Test Token", "PKB", 18)
    {
        balances[msg.sender] = 1000 ether;
        totalSupply_ = balances[msg.sender];
        emit Transfer(address(0), msg.sender, totalSupply_);
    }

    function freeze(uint thawTS) public notFrozen(msg.sender) {
        m_freeze_info[msg.sender] = thawTS;
    }

    function transferFrom(address _from, address _to, uint256 _value) public notFrozen(_from) returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }

    function transfer(address _to, uint256 _value) public notFrozen(msg.sender) returns (bool) {
        return super.transfer(_to, _value);
    }

    mapping (address => uint) m_freeze_info;
}
