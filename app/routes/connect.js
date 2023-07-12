const mysql = require("mysql2");
const dbConnection = mysql.createPool({
    host     : 'localhost', // MYSQL HOST NAME
    user     : 'root', // MYSQL USERNAME
    password : '', // MYSQL PASSWORD
    database : 'mydb' // MYSQL DB NAME
}).promise();

module.exports = dbConnection;