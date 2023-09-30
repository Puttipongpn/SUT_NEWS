const mysql = require("mysql2");
const dbConnection = mysql.createPool({
    host     : 'localhost', // MYSQL HOST NAME
    user     : 'root', // MYSQL USERNAME
    password : '', // MYSQL PASSWORD
    database : 'sut_news' // MYSQL DB NAME
}).promise();

module.exports = dbConnection;