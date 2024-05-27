import mysql from 'mysql';

export const db = mysql.createConnection({
    host: 'mysql',  // Nome do contêiner MySQL definido no comando docker run
    user: 'giovanna',
    password: 'admin',
    database: 'crud_user',
    port: 3306
});
