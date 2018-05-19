pragma solidity 0.4.23;

import "./Yashchex.sol";

contract TestBox {
    Yashchex y;

    constructor(Yashchex y_) public {
        y = y_;
    }

    function addBox(address box) public {
        y.addBox(box);
    }

    function state(bool ok, bool opened, string location, string error) public {
        y.state(ok, opened, location, error);
    }

    function close(address box) public {
        y.close(box);
    }

    function setReceiver(address box, address receiver) public {
        y.setReceiver(box, receiver);
    }

    function setSecretHash(address box, string secret) public {
        y.setSecretHash(box, secret);
    }

    function open(address box, string secret) public {
        y.open(box, secret);
    }

    function ifCanBeOpened(address box) public view returns(bool) {
        y.ifCanBeOpened(box);
    }

    function getStatesCount(address box) public view returns(uint) {
        y.getStatesCount(box);
    }
}
