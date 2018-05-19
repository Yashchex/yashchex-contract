'use strict';

const Yashchex = artifacts.require('Yashchex.sol');


module.exports = function(deployer, network) {
    deployer.deploy(Yashchex);
};
