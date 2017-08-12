import { doWork } from '../src/index';
import * as assert from 'assert';

describe('doWork', () => {

    it('should return 10', () => {
        assert.equal(doWork(), 10, 'doWork should return 10');
    });
});
