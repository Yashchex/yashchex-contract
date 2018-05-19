'use strict';

const Yashchex = artifacts.require('Yashchex.sol');

contract('Yashchex', function(accounts) {

    it('test constructor', async function () {
        const yashchex = await Yashchex.new();
    });

    // it('test freeze', async function () {
    //     const token = await Yashchex.new({from: accounts[0]});
    //
    //     await token.transfer(accounts[1], 1000, {from: accounts[0]});
    //
    //     await token.freeze(2000000000, {from: accounts[0]});
    //
    //     await expectThrow(token.transfer(accounts[1], 1000, {from: accounts[0]}));
    // });
});