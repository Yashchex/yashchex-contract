pragma solidity ^0.4.2;

contract Yashchex {

    struct State {
        bool ok;
        bool opened;
        string location;
        string error;
        uint256 timestamp;
    }

    address[] boxes;
    mapping(address => address) private owner;
    mapping(address => State[]) private states;

    mapping (address => bool) canBeOpened;
    mapping(address => bytes32) private secretHash;
    mapping(address => address) private receivers;

    modifier onlyOwner(address box) {
        require(owner[box] == msg.sender);
        _;
    }

    constructor() public {}

    function addBox(address box) public {
        if (owner[box] == 0) {
            boxes.push(box);
            owner[box] = msg.sender;
        }
    }

    function state(bool ok, bool opened, string location, string error) public {
        states[msg.sender].push(State({ok : ok, opened : opened, location : location, error : error, timestamp : now}));
    }

    function close(address box) public onlyOwner(box) {
        canBeOpened[box] = false;
    }

    function setReceiver(address box, address receiver) public onlyOwner(box) {
        receivers[box] = receiver;
    }

    function setSecret(address box, string secret) public {
        require(receivers[box] == msg.sender);
        secretHash[box] = keccak256(secret);
    }

    function open(address box, string secret) public {
        require(secretHash[box] == keccak256(secret));
        canBeOpened[box] = true;
    }

    function getBoxes() public view returns(address[]) {
        return boxes;
    }

    function ifCanBeOpened(address box) public view returns(bool) {
        return canBeOpened[box];
    }

    function getStatesCount(address box) public view returns(uint) {
        return states[box].length;
    }

    function getLastState(address box) public view returns(bool ok, bool opened, string location, string error, uint256 timestamp) {
        uint length = states[box].length;
        State storage s = states[box][length-1];
        return (s.ok, s.opened, s.location, s.error, s.timestamp);
    }

    function getState(address box, uint index) public view returns(bool ok, bool opened, string location, string error, uint256 timestamp) {
        require(index < states[box].length);
        State storage s = states[box][index];
        return (s.ok, s.opened, s.location, s.error, s.timestamp);
    }
}
