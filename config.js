var mysql = require('mysql');

var connection = mysql.createConnection({
    host: 'us-cdbr-east-04.cleardb.com',
    user: 'bc04be7870baa3',
    password: '7d2c4a17',
    database: 'heroku_76e93ad781b4526'
});

// var connection = mysql.createConnection({
//     host     : 'webprojectmockup.com',
//     user     : 'webprojectmockup_social_app',
//     password : '@2$2O=@oa=X3',
//     database : 'webprojectmockup_social_app'
// });

module.exports = connection;