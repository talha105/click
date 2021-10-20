var mysql = require('mysql');

var connection = mysql.createConnection({
    host: 'us-cdbr-east-04.cleardb.com',
    user: 'b05a2363462e76',
    password: '40e3a8aa',
    database: 'heroku_87901639514106d'
});

// var connection = mysql.createConnection({
//     host     : 'webprojectmockup.com',
//     user     : 'webprojectmockup_social_app',
//     password : '@2$2O=@oa=X3',
//     database : 'webprojectmockup_social_app'
// });

module.exports = connection;