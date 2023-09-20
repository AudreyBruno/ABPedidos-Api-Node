import Mysql from "mysql";
import dotenv from "dotenv";

dotenv.config();

const host = process.env.DATA_BASE_HOST;
const user = process.env.DATA_BASE_USER;
const password = process.env.DATA_BASE_PASSWORD;
const database = process.env.DATA_BASE;

const db = Mysql.createPool({
    connectionLimit: 10,
    host: host,
    user: user,
    password: password,
    database: database
});

async function executeQuery(connection, query, parameters){
    return new Promise((resolve, reject) => {
        connection.query(query, parameters, (err, result) => {
            if (err)
                return reject(err);
            else
                return resolve(result);
        });
    });
};

export {db, executeQuery};