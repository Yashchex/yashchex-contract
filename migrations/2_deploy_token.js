'use strict';

const HelloWorld = artifacts.require('HelloWorld.sol');


module.exports = function(deployer, network) {
    deployer.deploy(HelloWorld, 'Gosha');
};
