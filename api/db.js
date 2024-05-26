import mysql from "mysql"

export const db = mysql.createConnection({
    host: "172.17.0.1",
    user: "root",
    password: "admin123",
    database: "crud",
    port: 3307
})