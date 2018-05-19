'use strict';

const Yashchex = artifacts.require('Yashchex.sol');

const TestBox = artifacts.require('TestBox.sol');

contract('Yashchex', function(accounts) {

    it('test constructor', async function () {
        const yashchex = await Yashchex.new();
    });

    it('test write state', async function () {
        const yashchex = await Yashchex.new();

        const box = accounts[1]

        await yashchex.addBox(box);

        const state1 = {
            ok: true,
            opened: true,
            location: '55.7522200, 37.6155600',
            error: 0
        }

        await yashchex.state(state1.ok, state1.opened, state1.location, state1.error, {from: box});

        const count = await yashchex.getStatesCount(box);

        assert.equal(count, 1)

        const state_arr = await yashchex.getLastState(box);

        const state = {
            ok: state_arr[0],
            opened: state_arr[1],
            location: state_arr[2],
            error: state_arr[3],
            timestamp: state_arr[4]
        }

        assert.equal(state.ok, state1.ok);
        assert.equal(state.opened, state1.opened);
        assert.equal(state.location, state1.location);
        assert.equal(state.error, 0);

    });
});