const cds = require('@sap/cds');
const moment = require('moment');
const { serve } = require('@sap/cds');

module.exports = async function () {
    const db = cds.connect.to('db');
    const { IFLT0001 } = db.entities('ifl.db');

    this.before('READ', (req) => {
        console.log('test');
    });

    this.on('READ', (req) => {
        console.log('READ Call');

        //Status에 대한 처리
        req.on('succeeded', (req) => {
            console.log('READ Succeed');
        });
        req.on('failed', () => {
            console.log('READ Failed');
        });
        req.on('done', () => {
            console.log('READ Done');
        });
    });

    this.after('READ', (req) => {
        req[0];
        req[0];
        console.log('READ Succeed');
    });

    this.on('CREATE', `IFLT0001`, (req) => {
        /* UTC+9 처리를 위한 Custom Logic*/
        // var tDate = moment.utc().utcOffset('+09:00');
        // var tUCT9 = tDate.format('YYYY-MM-DD[T]HH:mm:ss.SSS[Z]');

        // if (req.target.elements.createdAt) req.data.createdAt = tUCT9;
        // if (req.target.elements.modifiedAt) req.data.modifiedAt = tUCT9;

        // req.data.CREATE_DATE = tDate.format('YYYY-MM-DD');
        // req.data.CREATE_TIME = tDate.format('HH:mm:ss');
        // req.data.START_DATE = tDate.format('YYYY-MM-DD');
        // req.data.START_TIME = tDate.format('HH:mm:ss');
        // req.data.END_DATE = tDate.format('YYYY-MM-DD');
        // req.data.END_TIME = tDate.format('HH:mm:ss');

        //Status에 대한 처리
        req.on('succeeded', () => {
            console.log('CREATE Succeed');
        });
        req.on('failed', () => {
            console.log('CREATE Failed');
        });
        req.on('done', () => {
            console.log('CREATE Done');
        });
    });

    this.on('UPDATE', (req) => {
        /* UTC+9 처리를 위한 Custom Logic*/
        // var tDate = moment.utc().utcOffset('+09:00');
        // var tUCT9 = tDate.format('YYYY-MM-DD[T]HH:mm:ss.SSS[Z]');

        // if (req.target.elements.modifiedAt) req.data.modifiedAt = tUCT9;

        //Status에 대한 처리
        req.on('succeeded', () => {
            console.log('UPDATE Succeed');
        });
        req.on('failed', () => {
            console.log('UPDATE Failed');
        });
        req.on('done', () => {
            console.log('UPDATE Done');
        });
    });
};
