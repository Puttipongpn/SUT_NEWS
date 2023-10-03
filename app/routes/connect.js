const mysql = require("mysql2");
const dbConnection = mysql.createPool({
    host     : 'localhost', // MYSQL HOST NAME
    user     : 'root', // MYSQL USERNAME
    password : '', // MYSQL PASSWORD
    database : 'project_s' // MYSQL DB NAME
}).promise();

module.exports = dbConnection;