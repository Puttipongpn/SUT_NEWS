require('dotenv').config();
const mysql = require("mysql2");

const dbConnection = mysql.createPool({
    host     : process.env.DB_HOST || 'localhost', // MYSQL HOST NAME
    user     : process.env.DB_USER || 'root', // MYSQL USERNAME
    password : process.env.DB_PASSWORD || '', // MYSQL PASSWORD
    database : process.env.DB_NAME || 'sut_new_2' // MYSQL DB NAME
}).promise();

module.exports = dbConnection;
